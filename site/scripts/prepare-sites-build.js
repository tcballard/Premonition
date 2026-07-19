import { copyFile, mkdir, readFile, writeFile } from 'node:fs/promises';

let html = await readFile('dist/index.html', 'utf8');

html = await inlineStyles(html);
html = await inlineModules(html);

function escapeForModule(value) {
  return JSON.stringify(value);
}

async function inlineStyles(input) {
  const pattern = /<link rel="stylesheet" crossorigin href="([^"]+)"\s*>|<link rel="stylesheet" href="([^"]+)"\s*>/g;
  return replaceAsync(input, pattern, async (_match, withCrossorigin, href) => {
    const file = withCrossorigin || href;
    const css = await readFile(`dist/${file.replace(/^\//, '')}`, 'utf8');
    return `<style>${css}</style>`;
  });
}

async function inlineModules(input) {
  const pattern = /<script type="module" crossorigin src="([^"]+)"><\/script>|<script type="module" src="([^"]+)"><\/script>/g;
  return replaceAsync(input, pattern, async (_match, withCrossorigin, src) => {
    const file = withCrossorigin || src;
    const js = await readFile(`dist/${file.replace(/^\//, '')}`, 'utf8');
    return `<script type="module">${js}</script>`;
  });
}

async function replaceAsync(input, pattern, replacer) {
  const matches = [...input.matchAll(pattern)];
  if (!matches.length) return input;

  let output = '';
  let offset = 0;
  for (const match of matches) {
    output += input.slice(offset, match.index);
    output += await replacer(...match);
    offset = match.index + match[0].length;
  }
  output += input.slice(offset);
  return output;
}

const serverSource = `const html = ${escapeForModule(html)};

export default {
  async fetch(request) {
    if (request.method === 'GET' || request.method === 'HEAD') {
      return new Response(request.method === 'HEAD' ? null : html, {
        headers: {
          'cache-control': 'public, max-age=300',
          'content-type': 'text/html; charset=utf-8'
        }
      });
    }

    return new Response('Method not allowed', {
      status: 405,
      headers: { allow: 'GET, HEAD' }
    });
  }
};
`;

await mkdir('dist/server', { recursive: true });
await mkdir('dist/.openai', { recursive: true });
await copyFile('.openai/hosting.json', 'dist/.openai/hosting.json');
await writeFile('dist/server/index.js', serverSource);
