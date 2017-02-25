/**
 * bits: common JavaScript
 * © 2014 Keegan Quinn
 */

$(document).ready(function() {
  // Open all external links in new tabs/windows
  $("a[href^='http://']").attr("target", "_blank");
  $("a[href^='https://']").attr("target", "_blank");
});
