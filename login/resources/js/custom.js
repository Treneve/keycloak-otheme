function initLocaleToggle() {
  const localeRoot = document.getElementById('kc-locale');
  const localeSelect = document.getElementById('login-select-toggle');

  const container = localeRoot || (localeSelect && (localeSelect.closest('.pf-v5-c-form-control') || localeSelect.parentElement));
  if (!container || container.dataset.tekLocaleEnhanced === 'true') {
    return;
  }

  const localeTargets = {};
  const englishLocales = ['en', 'en-us', 'en-gb'];
  const norwegianLocales = ['no', 'nb', 'nn'];

  const extractLocale = (href) => {
    if (!href) {
      return null;
    }
    const match = href.match(/kc_locale=([^&]+)/i);
    return match && match[1] ? match[1].toLowerCase() : null;
  };

  let selectedLocale = null;

  if (localeRoot) {
    const links = Array.from(localeRoot.querySelectorAll('a[href*="kc_locale="]'));
    links.forEach((anchor) => {
      const href = anchor.href || anchor.getAttribute('href');
      const locale = extractLocale(href);
      if (!locale) {
        return;
      }
      localeTargets[locale] = href;
      if (anchor.id === 'kc-current-locale-link') {
        selectedLocale = locale;
      }
    });
  } else if (localeSelect) {
    Array.from(localeSelect.options).forEach((option) => {
      const href = option.value;
      const locale = extractLocale(href);
      if (!locale) {
        return;
      }
      localeTargets[locale] = href;
      if (option.selected) {
        selectedLocale = locale;
      }
    });
  }

  const englishKey = englishLocales.find((key) => localeTargets[key]);
  const norwegianKey = norwegianLocales.find((key) => localeTargets[key]);

  if (!englishKey || !norwegianKey) {
    return;
  }

  const docLang = (document.documentElement.getAttribute('lang') || '').toLowerCase();
  const inferState = () => {
    if (englishLocales.includes(docLang)) {
      return 'english';
    }
    if (norwegianLocales.includes(docLang)) {
      return 'norwegian';
    }
    if (selectedLocale) {
      if (englishLocales.includes(selectedLocale)) {
        return 'english';
      }
      if (norwegianLocales.includes(selectedLocale)) {
        return 'norwegian';
      }
    }
    return 'english';
  };

  let activeState = inferState();

  const getHrefForState = (state) => {
    const targetKey = state === 'english' ? englishKey : norwegianKey;
    return localeTargets[targetKey];
  };

  const switchLink = document.createElement('a');
  switchLink.className = 'tek-locale-switch';
  switchLink.rel = 'alternate';

  const updateLink = () => {
    const nextState = activeState === 'english' ? 'norwegian' : 'english';
    const targetHref = getHrefForState(nextState);

    const labelText = nextState === 'english' ? 'English' : 'Norsk';
    switchLink.textContent = labelText;
    switchLink.setAttribute('aria-label', `Switch language to ${labelText}`);

    if (targetHref) {
      switchLink.href = targetHref;
      switchLink.removeAttribute('aria-disabled');
    } else {
      switchLink.href = '#';
      switchLink.setAttribute('aria-disabled', 'true');
    }
  };

  updateLink();

  switchLink.addEventListener('click', (event) => {
    if (switchLink.getAttribute('aria-disabled') === 'true') {
      event.preventDefault();
      return;
    }
    const nextState = activeState === 'english' ? 'norwegian' : 'english';
    const targetHref = getHrefForState(nextState);
    if (!targetHref) {
      event.preventDefault();
      return;
    }
    activeState = nextState;
    // allow default navigation; update link text immediately for responsiveness
    updateLink();
  });

  const globe = document.createElement('span');
  globe.className = 'tek-locale-globe';

  const fragment = document.createDocumentFragment();
  fragment.append(switchLink, globe);

  container.innerHTML = '';
  container.classList.remove('pf-v5-c-form-control', 'pf-v5-c-form-control__utilities');
  container.appendChild(fragment);
  container.classList.add('tek-locale-container');
  container.dataset.tekLocaleEnhanced = 'true';
}


window.addEventListener('load', function () {
  var usernameField = document.getElementById('username');
  var passwordField = document.getElementById('password');

  if (usernameField && usernameField.value) {
    passwordField.focus();
  }


    const checkbox = document.getElementById("rememberme");
    const cookieRefRememberMe = document.getElementById("cookieRefRememberMe");
    const realmPath = (document.getElementById("realmPath") || {}).value;
    if (checkbox && cookieRefRememberMe) {
      checkbox.addEventListener("change", function () {
        if (checkbox.checked) {
          document.cookie = "rme=" +cookieRefRememberMe.value+"; path="+realmPath+"/; max-age=" + 90 * 24 * 60 * 60;
          console.log("Cookie set: myCheckboxAccepted=true");
        } else {
          document.cookie = "rme=; path="+realmPath+"/; expires=Thu, 01 Jan 1970 00:00:00 UTC;";
          console.log("Cookie removed: myCheckboxAccepted");
        }
      });
    }

    initLocaleToggle();
});

    
