# Keycloak Login Theme Best Practices
**Target**: `keycloak.v2` theme (PatternFly v5)

This doc set captures a practical, upgrade‑friendly way to style a Keycloak login that uses PatternFly v5. It’s based on these principles:

- **Extend, don’t edit** the bundled theme.
- Prefer **PatternFly tokens** (CSS variables) and **component tokens** over deep selectors.
- **Scope** overrides to the login container, so the Admin/Account consoles remain unaffected.
- **Dark mode**: let PF5 drive it; only add scoped adjustments when necessary.
- Use **Keycloak `kc*` hooks** to map template parts to PF classes where structure changes are needed.
- Keep a **thin override layer**: small, token‑level CSS + a few focused layout rules.
- Ship as a **versioned theme** artifact; re‑enable caching in production.

## Contents
- [00 – Overview & decisions](00-overview.md)
- [01 – Theme structure & loading order](01-theme-structure.md)
- [02 – Tokens & scoping strategy](02-tokens-and-scoping.md)
- [03 – Dark mode: the safe way](03-dark-mode.md)
- [04 – Keycloak `kc*` hooks](04-kc-hooks.md)
- [05 – Forms (inputs, helper text, validation)](05-forms.md)
- [06 – Buttons (primary: dark blue + white)](06-buttons.md)
- [07 – Assets, fonts & packaging](07-assets-and-packaging.md)
- [08 – Do’s and Don’ts](08-dos-and-donts.md)
- [09 – Starter snippets (copy/paste)](09-starter-snippets.md)

---

> **Quick start**: If you only read one thing, read [09 – Starter snippets](09-starter-snippets.md). It shows a minimal `theme.properties` and a modular CSS layout you can paste into a child theme.
