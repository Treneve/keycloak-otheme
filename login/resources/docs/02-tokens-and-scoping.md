# 02 – Tokens & scoping strategy

PatternFly v5 exposes **semantic tokens** (e.g., `--pf-v5-global--primary-color--100`) and **component tokens** (e.g., `--pf-v5-c-button--m-primary--BackgroundColor`). They’re the most stable way to theme.

## Scope your overrides
Apply brand tokens **inside** the login container so nothing leaks into other UIs. In this repo, tokens live in `resources/css/modules/_tokens.css`:
```css
/* resources/css/modules/_tokens.css */
.pf-v5-c-login {
  /* Brand tokens – define once, reuse */
  --brand-text: #000000;
  --brand-text-muted: rgba(0,0,0,.60);
  --brand-link: #003847;
  --brand-primary: #00B3B3;              /* teal accents (focus) */
  --brand-primary-accent: #28FAFF;       /* hover accent */
  --brand-light-blue: #CCF0F0;
  --brand-light-blue-bg: #E8F9F9;

  --brand-danger: #D30000;
  --brand-danger-bg: #FBE6E6;
  --brand-success: #007A0F;
  --brand-success-bg: #E6F2E7;
  --brand-warning-bg: #FCEFD1;

  /* Button palette (see Buttons doc for details) */
  --brand-button-bg: #003847;
  --brand-button-bg--hover: #00242e;
  --brand-button-bg--active: #004a58;

  /* Prefer PF5 font tokens */
  --pf-v5-global--FontFamily--text: "Tekna", system-ui, -apple-system, "Segoe UI", Roboto, Helvetica, Arial;
  --pf-v5-global--FontFamily--heading: "Tekna Display","Tekna", system-ui, -apple-system, "Segoe UI", Roboto, Helvetica, Arial;

  background-color: var(--brand-light-blue-bg);
}
```

## Use component tokens where available
Example for buttons (see `resources/css/modules/_buttons.css`):
```css
.pf-v5-c-login .pf-v5-c-button {
  --pf-v5-c-button--m-primary--BackgroundColor: var(--brand-button-bg);
  --pf-v5-c-button--m-primary--hover--BackgroundColor: var(--brand-button-bg--hover);
  --pf-v5-c-button--m-primary--active--BackgroundColor: var(--brand-button-bg--active);
  --pf-v5-c-button--m-primary--Color: #fff;
}
```

## Provide safe fallbacks
Token names can change between PatternFly releases. Pair token usage with focused, low‑specificity fallbacks:
```css
.pf-v5-c-login .pf-v5-c-button.pf-m-primary { background-color: var(--brand-button-bg); }
```

## Avoid deep selectors
- Don’t reach into PF component internals (e.g., `.pf-v5-c-button > span > svg`).
- Do rely on **component classes** and **tokens**.
