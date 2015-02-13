$(document).ready(function(){
  var height = ($( ".info-left" ).height());
  var priceHeight = ($("#price").height());

  $("#map-canvas.info-right" ).height(height);

  var navHeight = ($("#nav-bar").height());
  var footHeight = 45;

  $( window ).resize(function() {
    var windowHeight = $(window).height();
    $("#map-canvas.index-map" ).height(windowHeight-navHeight-footHeight);
    $("#wrapper" ).height(windowHeight-navHeight-footHeight);
  });
});
