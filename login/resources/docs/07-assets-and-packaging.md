# 07 – Assets, fonts & packaging

## Assets
- Put assets under `login/resources/`:
  - `img/` for images & logos
  - `css/woff2/` for `.woff2` (this repo layout)
  - `css/` for styles
- Use **relative URLs** in CSS: `url("../img/brand-login-bg.jpg")`.
- Don’t base64‑inline large images.
- Keep images optimized; prefer SVG for logos.

## Fonts (this repo)
```css
@font-face {
  font-family: "Tekna";
  src: url("../woff2/Tekna-Regular.woff2") format("woff2");
  font-weight: 400;
  font-display: swap;
}
@font-face {
  font-family: "Tekna";
  src: url("../woff2/Tekna-Bold.woff2") format("woff2");
  font-weight: 700;
  font-display: swap;
}
@font-face {
  font-family: "Tekna Display";
  src: url("../woff2/TeknaDisplay-Regular.woff2") format("woff2");
  font-weight: 400;
  font-display: swap;
}
```

## Packaging
- Package as a **versioned JAR** with `META-INF/keycloak-themes.json`, or mount the folder in container images.
- Re‑enable theme caching in production.
- Track your theme in source control; treat it like application code.

## Optional footer/content
- You can add a `footer.ftl` to include links (Terms, Privacy) without changing the login form structure.
- The Vipps button logo is referenced by `_social.css` via `background: url(../img/logo-vipps.svg)`.
