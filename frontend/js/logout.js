(function (global, document) {
  "use strict";

  global.logout = function() {
    global.cookieDelete("chatOwnerToken");
    document.location = global.origin + "/login";
  }

} (window.chat, document));
