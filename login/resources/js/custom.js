

window.onload = function() {
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

};

    