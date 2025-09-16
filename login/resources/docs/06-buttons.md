# 06 – Buttons (primary: dark blue + white)

Primary buttons are **dark blue** with **white text** for accessibility. Teal remains the focus accent.

## Tokens + fallbacks (module `_buttons.css`)
```css
/* Light mode defaults */
.pf-v5-c-login {
  --brand-button-bg: #003847;
  --brand-button-bg--hover: #00242e;
  --brand-button-bg--active: #004a58;
}

.pf-v5-c-login .pf-v5-c-button {
  --pf-v5-c-button--m-primary--BackgroundColor: var(--brand-button-bg);
  --pf-v5-c-button--m-primary--hover--BackgroundColor: var(--brand-button-bg--hover);
  --pf-v5-c-button--m-primary--active--BackgroundColor: var(--brand-button-bg--active);
  --pf-v5-c-button--m-primary--Color: #fff;

  /* Secondary */
  --pf-v5-c-button--m-secondary--BackgroundColor: #fff;
  --pf-v5-c-button--m-secondary--hover--BackgroundColor: #CCF0F0;
  --pf-v5-c-button--m-secondary--after--BorderColor: #003847;
  --pf-v5-c-button--m-secondary--Color: #003847;
  --pf-v5-c-button--after--BorderRadius: 0;

  /* Sizing */
  --pf-v5-c-button--PaddingTop: 17px;
  --pf-v5-c-button--PaddingBottom: 17px;
}

/* Fallbacks */
.pf-v5-c-login .pf-v5-c-button.pf-m-primary {
  background-color: var(--brand-button-bg);
  color: #fff;
}
.pf-v5-c-login .pf-v5-c-button.pf-m-primary:hover { background-color: var(--brand-button-bg--hover); }
.pf-v5-c-login .pf-v5-c-button.pf-m-primary:active { background-color: var(--brand-button-bg--active); }

/* Keyboard focus */
.pf-v5-c-login .pf-v5-c-button.pf-m-primary:focus-visible {
  outline: 2px solid var(--brand-yellow);
  outline-offset: 2px;
}

/* Disabled */
.pf-v5-c-login .pf-v5-c-button.pf-m-primary:disabled,
.pf-v5-c-login .pf-v5-c-button.pf-m-primary.pf-m-disabled {
  background-color: #2c3e44;
  border-color: #2c3e44;
  color: rgba(255,255,255,.7);
}

/* Dark mode: keep separation from the dark page background */
.pf-v5-theme-dark .pf-v5-c-login {
  --brand-button-bg: #005063;
  --brand-button-bg--hover: #00242e;
  --brand-button-bg--active: #004a58;
}

/* Link-style buttons match link rules */
.pf-v5-c-login .pf-v5-c-button.pf-m-link {
  color: var(--brand-link);
  text-decoration: underline;
}
```
