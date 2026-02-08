(function (global, document) {
  "use strict";

  (document);

  // Opens the import window.
  global.importOpen = function() {
    $(".view").hide();
    $("#import-view").show();
  }

  global.importDisqus = function() {
    var url = $("#disqus-url").val();
    var data = global.dashboard.$data;

    var json = {
      "ownerToken": global.cookieGet("chatOwnerToken"),
      "domain": data.domains[data.cd].domain,
      "url": url,
    }

    global.buttonDisable("#disqus-import-button");
    global.post(global.origin + "/api/domain/import/disqus", json, function(resp) {
      global.buttonEnable("#disqus-import-button");

      if (!resp.success) {
        global.globalErrorShow(resp.message);
        return;
      }

      $("#disqus-import-button").hide();

      global.globalOKShow("Imported " + resp.numImported + " comments!");
    });
  }

  global.importCommento = function() {
    var url = $("#samlet-chat-url").val();
    var data = global.dashboard.$data;

    var json = {
      "ownerToken": global.cookieGet("chatOwnerToken"),
      "domain": data.domains[data.cd].domain,
      "url": url,
    }

    global.buttonDisable("#samlet-chat-import-button");
    global.post(global.origin + "/api/domain/import/samlet-chat", json, function(resp) {
      global.buttonEnable("#samlet-chat-import-button");

      if (!resp.success) {
        global.globalErrorShow(resp.message);
        return;
      }

      $("#samlet-chat-import-button").hide();

      global.globalOKShow("Imported " + resp.numImported + " comments!");
    });
  }

} (window.chat, document));
