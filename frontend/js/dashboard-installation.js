(function (global, document) {
  "use strict";

  (document);

  // Opens the installation view.
  global.installationOpen = function() {
    var html = "" +
               "<script defer src=\"" + global.cdn + "/js/samlet-chat.js\"><\/script>\n" +
               "<div id=\"samlet-chat\"></div>\n" +
               "";

    $("#code-div").text(html);

    $("pre code").each(function(i, block) {
      hljs.highlightBlock(block);
    });

    $(".view").hide();
    $("#installation-view").show();
  };

} (window.samlet-chat, document));
