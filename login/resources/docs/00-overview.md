# 00 – Overview & Decisions

This theme customizes Keycloak `keycloak.v2` (PatternFly v5) with a small, modular CSS layer. It favors PF tokens and component variables over deep selectors, keeps overrides scoped to the login container, and loads files in a strict order for predictable cascade.

## Current Layout
```
resources/
  css/
    styles.css                 # page layout + background image
    modules/
      _fonts.css              # @font-face rules (../woff2/*)
      _tokens.css             # brand tokens + background on .pf-v5-c-login
      _typography.css         # headings, body, labels, links
      _forms.css              # inputs, placeholders, validation
      _buttons.css            # PF button tokens + fallbacks
      _alerts.css             # alert colors + inline reset
      _components.css         # divider + login footer band
      _social.css             # Vipps button + logo injection
      _dark-mode.css          # scoped dark tweaks
    woff2/                    # font files (this repo layout)
  img/
```

## Load Order (theme.properties)
The theme loads multiple stylesheets via `styles=` (faster and more parallel than CSS `@import`).

```properties
parent=keycloak.v2
import=common/keycloak
styles=css/styles.css css/modules/_fonts.css css/modules/_tokens.css css/modules/_typography.css css/modules/_forms.css css/modules/_buttons.css css/modules/_alerts.css css/modules/_components.css css/modules/_social.css css/modules/_dark-mode.css

# Optional: map the main title size
kcLoginMainTitle=pf-v5-c-title pf-m-2xl
```

## Key Decisions
- Scope tokens and overrides to `.pf-v5-c-login` so Admin/Account consoles remain unaffected.
- Prefer PF5 component tokens (e.g., `--pf-v5-c-button-*`, `--pf-v5-c-form-control-*`) with minimal fallbacks.
- Keep page layout (background, container tweaks) in `styles.css`; put theming in `modules/`.
- Use `styles=` to control cascade order; avoid CSS `@import` in production.

## Assets & Paths
- Fonts: `resources/css/woff2/*.woff2`; `@font-face` in `_fonts.css` uses `url("../woff2/*.woff2")`.
- Vipps logo in `_social.css`: `background: url(../img/logo-vipps.svg)`.

## Dark Mode
- PF toggles `.pf-v5-theme-dark`. Any brand-specific adjustments live in `_dark-mode.css`.
- Primary button on dark: `--brand-button-bg` = `#005063` with hover `#00242e`.

## Sanity Checklist
- Fonts: headings use “Tekna Display”; body uses “Tekna”.
- Inputs: border, hover/focus ring, placeholder color; invalid background.
- Buttons: primary/secondary states; focus outline; disabled color.
- Alerts: danger color and inline variant without extra padding.
- Vipps: button color, injected logo, accessible focus.
- Footer: divider line and muted text.

## Migration Notes
- Old `tekna-overrides.css` replaced by modules and removed from `styles=`.
- `styles.css` remains for layout and image references.

## Extending
- Add a new module under `resources/css/modules/` and append it to `styles=` in `theme.properties` at the correct position in the cascade.
- Prefer tokens over high-specificity selectors; keep everything scoped to `.pf-v5-c-login`.

