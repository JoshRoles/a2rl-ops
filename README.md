# A2RL Ops Site

Static dashboard site deployed on Vercel (`a2rl-ops.vercel.app`).

## Local development

1. Open this folder in Cursor.
2. Run:

```bash
npx --yes serve . -l 4173
```

3. Open `http://localhost:4173`.
4. Edit `index.html` (main app) and files under `assets/`.

## Deployment notes

- This repository is static HTML/CSS/JS.
- `vercel.json` currently controls URL behavior (`cleanUrls`, `trailingSlash`).
- No build step is required for deploy.

## Suggested next cleanup

- Extract inline CSS from `index.html` into `assets/styles.css`.
- Extract inline JavaScript into `assets/app.js`.
- Keep `index.html` focused on structure for faster iteration.
