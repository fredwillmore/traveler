
$.initialize = function() {
  console.log("hello I am initializing");
}

$(document).ready(function() {
    $.initialize();
    $("a.fancybox").fancybox();
});

{ doin: 'thangs'}