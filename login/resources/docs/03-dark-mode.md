# 03 – Dark mode: the safe way

Keycloak’s `keycloak.v2` enables PatternFly v5’s dark theme automatically. PF5 toggles a `pf-v5-theme-dark` class to swap tokens. This repo keeps dark tweaks in `resources/css/modules/_dark-mode.css`.

## Guidelines
- **Don’t** hardcode separate color sets for dark and light if the semantic tokens already handle it.
- **Do** add **scoped** adjustments where brand contrast requires it.
- If your brand isn’t ready for dark mode, disable dark mode at the realm level as a temporary measure.

## Example: scoped dark adjustments
```css
/* Background & typography on dark */
.pf-v5-theme-dark .pf-v5-c-login {
  background-color: #003847;  /* dark brand blue */
  --brand-text: #ffffff;
  --brand-text-muted: rgba(255,255,255,.80);
  --brand-link: #CCF0F0;       /* link on dark */
}

/* Inputs on dark */
.pf-v5-theme-dark .pf-v5-c-login .pf-v5-c-form-control {
  color: var(--brand-text);
  background-color: transparent;
  border-color: #ffffff;
  --pf-v5-c-form-control--BorderColor: #ffffff;
  --pf-v5-c-form-control--hover--BorderColor: #28FAFF;
  --pf-v5-c-form-control--focus--BorderColor: #00B3B3;
  --pf-v5-c-form-control--focus--BorderWidth: 1.5px;
}

/* Error color on dark */
.pf-v5-theme-dark .pf-v5-c-login .pf-v5-c-form-control[aria-invalid="true"] { border-color: #FF7676; }
.pf-v5-theme-dark .pf-v5-c-login .pf-v5-c-helper-text__item.pf-m-error { color: #FF7676; }

/* Optional: tweak button colors to avoid blending into the page bg */
.pf-v5-theme-dark .pf-v5-c-login {
  --brand-button-bg: #005063;
  --brand-button-bg--hover: #00242e;
  --brand-button-bg--active: #004a58;
}
```
