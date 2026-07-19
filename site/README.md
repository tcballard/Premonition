# Premonition field guide

Private/local review source for the Premonition Sites explainer. This is
submission-support collateral, not the macOS product.

```sh
npm install
npm run verify
npm run dev
```

`npm run build` creates a self-contained Sites worker entrypoint under
`dist/server/index.js`. A saved Sites version is not authority to deploy it.
Every Sites deployment URL is production; do not deploy without an explicit
owner decision.
