/**
getCurrentPosition() accepts 3 arguments:
a success callback (required), an error callback (optional), and a set of options (optional)
**/

var options = {
  // enableHighAccuracy = should the device take extra time or power to return a really accurate result, or should it give you the quick (but less accurate) answer?
  enableHighAccuracy: false,
  // timeout = how long does the device have, in milliseconds to return a result?
  timeout: 5000,
  // maximumAge = maximum age for a possible previously-cached position. 0 = must return the current position, not a prior cached position
  maximumAge: 0
};

// call getCurrentPosition()
navigator.geolocation.getCurrentPosition(success, error, options);

// upon success, do this
function success(pos){
  // get longitude and latitude from the position object passed in
  var lng = pos.coords.longitude;
  var lat = pos.coords.latitude;
  var latlng = new google.maps.LatLng(lat, lng);
  geocoder = new google.maps.Geocoder();
  geocoder.geocode({'latLng': latlng}, function(results, status){
    var cookie_val = results[1].formatted_address;
    document.cookie = "lat_lng=" + escape(cookie_val);
  });
};

// upon error, do this
function error(err){
  alert('Error: ' + err + ' :('); // alert the error message
}
