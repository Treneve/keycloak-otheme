# Language Toggle Override

This document records the overrides we ship with the Tekna login theme to replace the default PatternFly locale dropdown with a two-language toggle.

## Summary
- Duplicate of `keycloak.v2/login/template.ftl` lives in `docker/otheme/login/template.ftl`.
- Original dropdown markup is replaced by a toggle that swaps between English and Norwegian when both locales are available; otherwise we fall back to the stock dropdown.
- Upstream JavaScript helper (`initLocaleToggle`) was removed; the UI is rendered server-side.
- `<link rel="alternate" hreflang="…">` entries are emitted in the document `<head>` to surface correct language metadata.
- CSS support for the toggle is defined in `_components.css` (`.tek-locale-switch`, `.tek-locale-globe`).

## Rendering Behaviour
1. The template inherits from `keycloak.v2`. When Keycloak resolves `login/template.ftl`, our copy takes precedence.
2. Inside the header block, the template collects `locale.supported` entries and looks for language tags in two buckets:
   - English variants: `en`, `en-us`, `en-gb`
   - Norwegian variants: `no`, `nb`, `nn`
3. If URLs exist for both buckets, we compute which language should be shown next based on `locale.currentLanguageTag`. The link text is fixed to `English` or `Norsk`.
4. If either language is missing, the template renders the untouched dropdown markup from the parent theme.

## Accessibility & SEO
- The toggle anchor carries `rel="alternate"`, `hreflang`, and an `aria-label` like `Switch language to Norsk` so screen readers announce the action clearly.
- Each supported locale also receives a `<link rel="alternate" hreflang="…">` element in the head for search engines.

## CSS Hooks
- `.tek-locale-container`, `.tek-locale-switch` and `.tek-locale-globe` live in `docker/otheme/login/resources/css/modules/_components.css`.


## Maintenance Notes
- To adjust which locales map to the toggle, edit the `EN` and `NO` arrays near the top of the override block in `template.ftl`.
- Additional languages can be handled by extending the markup or falling back to the dropdown; the template already uses the dropdown fallback when the toggle is not viable.
- If you modify the link text, update both the text node and the `aria-label` string.
- Remember to keep `styles.css` and `_components.css` in sync if you move or rename CSS selectors used by the toggle.


## Rollback
Switch the realm theme back to `keycloak.v2` or delete `docker/otheme/login/template.ftl` to restore default behaviour.
