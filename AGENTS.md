# Codex Session Notes

## 2025-05-19 – Keycloak Theme Findings
- Repo ships a Docker-based Keycloak env with Tekna login themes and plugins; live edits happen in `docker/otheme` (`docs/local-development.md`).
- `docker/otheme/login/theme.properties` extends `keycloak.v2` (PatternFly v5) and loads modular CSS via `styles=` plus `custom.js`.
- Layout + branding tweaks live in `resources/css/styles.css`; component tokens and dark-mode overrides are split across `resources/css/modules/`.
- `resources/js/custom.js` handles remember-me cookies and focusing the password field on load.
- Localized copy is maintained in `docker/otheme/login/messages/messages_{en,no}.properties`; mirror finalized changes into `docker/themes/mytheme` and the Maven resources tree for packaging.

## 2025-10-02 – Keycloak Docs (Working with themes)
- Official guide (<https://www.keycloak.org/ui-customization/themes>) confirms child themes should live under `themes/<name>/<type>` with a `theme.properties`; set `parent` to the base you extend (for `keycloak.v2`, use `parent=keycloak.v2`) and keep `import=common/keycloak` for shared assets.
- Use the `styles` property rather than `@import` to register CSS; list parent styles before your overrides (e.g. `styles=css/login.css css/styles.css`) so `keycloak.v2` tokens load first and your file wins the cascade.
- Re-enable theme caching in production as the docs note performance suffers when `--spi-theme-cache-themes-enabled=false` is left on.
- Docs also outline matching entries for `scripts=` and `resources/img`; stick to these hooks when adding JS or assets instead of editing upstream templates.

## 2025-10-05 – Theme Sync Workflow
- Local Docker environment serves templates from `docker/otheme/...`; use this tree for fast iteration.
- Production/test packages are built from `Tekna.Keycloak.Plugins/tekna-keycloak-resources/...`; mirror any accepted change from `docker/otheme` into the matching `tekna-modifications` file (plus CSS/JS) before committing.
- Only the Maven resources are bundled during plugin builds, so skipping the mirror step means deployed servers will miss the update even if local Docker looks correct.
