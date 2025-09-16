# 08 – Do’s and Don’ts

## Do
- Extend `keycloak.v2`; keep overrides in a child theme.
- Load CSS via `styles=` with multiple entries in the intended order (faster than `@import`).
- Prefer **PF5 tokens** and **component tokens**.
- **Scope** to `.pf-v5-c-login` to avoid side effects in Admin/Account consoles.
- Use **`kc*` hooks** (`theme.properties`) for structural tweaks.
- Provide **fallback rules** in case token names evolve.
- Keep variants accessible (contrast, focus rings, hit areas).
- Keep the override layer small for easier upgrades.

## Don’t
- Don’t edit files inside the bundled `keycloak.v2`.
- Don’t rely on deep/brittle selectors (e.g., `.pf-v5-c-button > span > svg`).
- Don’t hardcode separate colors for light/dark when tokens already handle it.
- Don’t set global fonts/colors without scoping; you may break Admin UI.
- Don’t disable outlines or keyboard focus styles.
