$(document).ready(function() {
  // Open all external links in new tabs/windows
  $("a[href^='http://']").attr("target", "_blank");
  $("a[href^='https://']").attr("target", "_blank");
});
