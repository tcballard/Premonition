import { readFile } from 'node:fs/promises';

const html = await readFile('index.html', 'utf8');
const css = await readFile('src/style.css', 'utf8');
const script = await readFile('src/main.js', 'utf8');

const requiredCopy = [
  'The fix was',
  'already waiting.',
  'Nothing leaves this machine unless it is error-shaped text',
  'does not redact it, store it or auto-apply',
  'git apply --check',
  'proves applicability',
  'provider retention',
  'Runtime engine',
  'recorded build partner',
  'Signed release pending verification',
];

for (const phrase of requiredCopy) {
  if (!html.includes(phrase)) throw new Error(`missing required copy: ${phrase}`);
}

for (const landmark of ['<header', '<main', '<section', '<footer']) {
  if (!html.includes(landmark)) throw new Error(`missing semantic landmark: ${landmark}`);
}

if (!html.includes('class="skip-link"')) throw new Error('missing skip link');
if (!css.includes(':focus-visible')) throw new Error('missing visible focus treatment');
if (!css.includes('prefers-reduced-motion')) throw new Error('missing reduced motion treatment');
if (!css.includes('@media (max-width: 1040px)') || !css.includes('@media (max-width: 520px)')) {
  throw new Error('missing representative responsive transformations');
}
if (!script.includes('data-dial-ticks')) throw new Error('missing functional admission dial');

const sectionCount = (html.match(/<section/g) || []).length;
if (sectionCount !== 3) throw new Error(`expected three concise sections, found ${sectionCount}`);

console.log('site source contract passed');
