# 05 – Forms (inputs, helper text, validation)

## Base input (module `_forms.css`)
```css
.pf-v5-c-login .pf-v5-c-form-control {
  --pf-v5-c-form-control--before--BorderTopWidth: 1px;
  --pf-v5-c-form-control--before--BorderRightWidth: 1px;
  --pf-v5-c-form-control--before--BorderBottomWidth: 1px;
  --pf-v5-c-form-control--before--BorderLeftWidth: 1px;

  --pf-v5-c-form-control--before--BorderTopColor: #b1b3b4;
  --pf-v5-c-form-control--before--BorderRightColor: #b1b3b4;
  --pf-v5-c-form-control--before--BorderBottomColor: #b1b3b4;
  --pf-v5-c-form-control--before--BorderLeftColor: #b1b3b4;

  --pf-v5-c-form-control--after--BorderBottomWidth: 0;
  --pf-v5-c-form-control--after--BorderBottomColor: transparent;

  --pf-v5-c-form-control--BorderColor: #b1b3b4;
  --pf-v5-c-form-control--hover--BorderColor: var(--brand-primary);
  --pf-v5-c-form-control--focus--BorderColor: var(--brand-primary);
  --pf-v5-c-form-control--BorderRadius: 0;

  --pf-v5-c-form-control--PaddingTop: 17px;
  --pf-v5-c-form-control--PaddingBottom: 17px;

  transition: border-color 180ms ease, box-shadow 180ms ease;
}

.pf-v5-c-login .pf-v5-c-form-control::placeholder {
  color: var(--brand-text-muted);
  opacity: 1;
}

/* Fallback behavior */
.pf-v5-c-login .pf-v5-c-form-control:not(:disabled):hover {
  border-color: var(--brand-primary);
  box-shadow: 0 0 0 2px var(--brand-primary);
  --pf-v5-c-form-control--before--BorderTopColor: var(--brand-primary);
  --pf-v5-c-form-control--before--BorderRightColor: var(--brand-primary);
  --pf-v5-c-form-control--before--BorderBottomColor: var(--brand-primary);
  --pf-v5-c-form-control--before--BorderLeftColor: var(--brand-primary);
}
.pf-v5-c-login .pf-v5-c-form-control:focus,
.pf-v5-c-login .pf-v5-c-form-control:focus-visible {
  box-shadow: none;
}

.pf-v5-c-form-control>:is(input,select,textarea):focus { outline: none; }
```

## Labels & helper text
```css
.pf-v5-c-login .pf-v5-c-form__label-text { font-size: .813rem; line-height: 1.6; color: var(--brand-text); }
.pf-v5-c-login .pf-v5-c-helper-text__item-text { font-size: 15px; line-height: 1.6; }
```

## Validation states
```css
/* Error */
.pf-v5-c-login .pf-v5-c-form-control[aria-invalid="true"] {
  border-color: var(--brand-danger);
  background-color: var(--brand-danger-bg);
}
.pf-v5-c-login .pf-v5-c-helper-text__item.pf-m-error { color: var(--brand-danger); }
```
