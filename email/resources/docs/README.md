# Tekna Email Theme Notes

### Overview
- Child theme lives in `docker/otheme/email` and extends Keycloak's built-in `keycloak` email theme via `theme.properties`.
- We ship both HTML and plaintext variants for each Keycloak email (`passwordreset`, `passwordchanged`, `code`). HTML templates are compiled, while text templates stay lean Freemarker snippets.
- Localized copy resides in `messages/messages_{en,no}.properties`; keep the keys in sync across languages.
- The runtime theme (`docker/otheme/...`) mirrors the packaged assets under `docker/themes/mytheme/...` and `Tekna.Keycloak.Plugins/.../themes/mytheme/...`. Update all three locations whenever templates change.

### HTML workflow
- Design iterations happen in a separate Bootstrap Email workspace (`../bootstrapemail5/app`). We edit `app/email*.html`, then compile with the Bootstrap Email v1.4.1 CLI so tables, inline CSS, and responsive helpers are generated.
- After compiling, swap dynamic values back to Freemarker placeholders (`${msg(...)}`, `${link}`, `${kcSanitize(...)}`) before copying the markup into `docker/otheme/email/html/*.ftl`.
- Preserve the comment `<!-- Compiled with Bootstrap Email version: 1.4.1 -->` and keep the markup XHTML 1.0 Strict compliant. Outlook rendering depends on it.

### Embedded Tekna font (base64)
- Email clients block remote font files, so we inline the regular Tekna webfont as a base64 data URI. The `@font-face` block at the top of `html/passwordreset-email.ftl` and `html/html-email.html` must remain identical.
- When the brand team delivers an updated font, run `base64 -w0 Tekna-Regular.woff2 > tekna-regular.b64` inside the Bootstrap Email workspace, then paste the encoded string into the `src: url(data:application/octet-stream;base64,...)` declaration. Retain `font-display: swap` and the existing fallbacks (`Helvetica, Arial, sans-serif`).
- Apply the same change in the mirrored theme locations (`docker/themes/mytheme/...` and the Maven resources module) to keep packaging consistent.
