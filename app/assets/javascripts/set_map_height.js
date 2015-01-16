$(document).ready(function(){
  var height = ($( ".info-left" ).height());
  var priceHeight = ($("#price").height());
  $(".info-right" ).height(height-priceHeight);
  var navHeight = ($("#nav-bar").height());
  $( window ).resize(function() {
    var windowHeight = $(window).height();
    $("#map-canvas" ).height(windowHeight-navHeight);
  });
});
