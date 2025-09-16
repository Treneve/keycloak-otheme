# 01 – Theme structure & loading order

## Create a child login theme
```
themes/
  mycompany/
    login/
      theme.properties
      resources/
        css/
          styles.css                 # page layout + images
          modules/
            _fonts.css              # @font-face rules
            _tokens.css             # brand tokens + background
            _typography.css         # headings, body, links
            _forms.css              # inputs, helper text, validation
            _buttons.css            # PF button tokens + fallbacks
            _alerts.css             # alert colors + inline reset
            _components.css         # divider + footer band
            _social.css             # Vipps button
            _dark-mode.css          # scoped dark overrides
        img/
        css/woff2/                  # font files (this repo layout)
```

### `theme.properties`
- **Extend** the shipped theme.
- **Load the parent CSS first**, then your overrides so you win the cascade.
- Use `kc*` keys to remap elements to PF classes when needed.

```properties
parent=keycloak.v2

# Load your styles in explicit order for reliable cascade.
# Using multiple entries here is faster than CSS @import.
styles=css/styles.css \
       css/modules/_fonts.css \
       css/modules/_tokens.css \
       css/modules/_typography.css \
       css/modules/_forms.css \
       css/modules/_buttons.css \
       css/modules/_alerts.css \
       css/modules/_components.css \
       css/modules/_social.css \
       css/modules/_dark-mode.css

# Example structural tweak (maps the main title to a PF title class)
kcLoginMainTitle=pf-v5-c-title pf-m-2xl
```

## Local development
Disable template/CSS caching so changes apply on refresh:
```bash
bin/kc.sh start   --spi-theme--static-max-age=-1   --spi-theme--cache-themes=false   --spi-theme--cache-templates=false
```

## Production packaging
- Ship the theme as a **versioned** artifact (e.g., a JAR with `META-INF/keycloak-themes.json`) to simplify rollbacks in clusters.
- Re‑enable caching and set a reasonable `static-max-age`.
- Keep the override layer small to reduce maintenance.
- Prefer Keycloak `styles=` list over CSS `@import` for parallel fetching.
