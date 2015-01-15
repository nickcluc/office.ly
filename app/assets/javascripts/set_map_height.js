$(document).ready(function(){
  var height = ($( ".info-left" ).height());
  var priceHeight = ($("#price").height())
  $(".info-right" ).height(height-priceHeight);
});
