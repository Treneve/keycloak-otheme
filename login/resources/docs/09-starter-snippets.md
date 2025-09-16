# 09 – Starter snippets (copy/paste)

## Minimal layout (modular CSS)
```
themes/
  mycompany/
    login/
      theme.properties
      resources/
        css/
          styles.css
          modules/
            _fonts.css
            _tokens.css
            _typography.css
            _forms.css
            _buttons.css
            _alerts.css
            _components.css
            _social.css
            _dark-mode.css
        css/woff2/
          Tekna-Regular.woff2
          Tekna-Bold.woff2
          TeknaDisplay-Regular.woff2
        img/
          brand-login-bg.jpg
```

## `theme.properties`
```properties
parent=keycloak.v2
styles=css/styles.css css/modules/_fonts.css css/modules/_tokens.css css/modules/_typography.css css/modules/_forms.css css/modules/_buttons.css css/modules/_alerts.css css/modules/_components.css css/modules/_social.css css/modules/_dark-mode.css
kcLoginMainTitle=pf-v5-c-title pf-m-2xl
```

## Module snippets
`resources/css/modules/_fonts.css`
```css
@font-face { font-family: "Tekna"; src: url("../woff2/Tekna-Regular.woff2") format("woff2"); font-weight: 400; font-style: normal; font-display: swap; }
@font-face { font-family: "Tekna"; src: url("../woff2/Tekna-Bold.woff2") format("woff2"); font-weight: 700; font-style: normal; font-display: swap; }
@font-face { font-family: "Tekna Display"; src: url("../woff2/TeknaDisplay-Regular.woff2") format("woff2"); font-weight: 400; font-style: normal; font-display: swap; }
```

`resources/css/modules/_tokens.css`
```css
.pf-v5-c-login {
  --brand-text: #000000;
  --brand-text-muted: rgba(0, 0, 0, .60);
  --brand-link: #003847;
  --brand-primary: #00B3B3;
  --brand-primary-accent: #28FAFF;
  --brand-light-blue: #CCF0F0;
  --brand-light-blue-bg: #E8F9F9;
  --brand-yellow: #F7D68B;
  --brand-danger: #D30000;
  --brand-danger-bg: #FBE6E6;
  --brand-success: #007A0F;
  --brand-success-bg: #E6F2E7;
  --brand-warning-bg: #FCEFD1;
  --brand-button-bg: #003847;
  --brand-button-bg--hover: #00242e;
  --brand-button-bg--active: #004a58;
  --pf-v5-global--FontFamily--text: "Tekna", system-ui, -apple-system, "Segoe UI", Roboto, Helvetica, Arial;
  --pf-v5-global--FontFamily--heading: "Tekna Display", "Tekna", system-ui, -apple-system, "Segoe UI", Roboto, Helvetica, Arial;
  background-color: var(--brand-light-blue-bg);
}
```

See other module files for examples.

