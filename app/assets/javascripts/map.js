var map;
var markers = [];
$(function(){
  var geocoder;
  var center_latitude = $('#center_latitude').val()
  var center_longitude = $('#center_longitude').val()
  function initialize() {
    window.mapWasInitialized = true;
    geocoder = new google.maps.Geocoder();
    var latlng = new google.maps.LatLng(center_latitude, center_longitude);
    var mapOptions = {
      zoom: 12,
      center: latlng,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
  }

  window.codeAddress = function(address,todo) {
    if (todo =="delete") {
      for (var i = 0; i < markers.length; i++) {
        // console.log("Inside - set map to null.")
        markers[i].setMap(null);
      }
      markers = [];
    } else {
      if(!window.mapWasInitialized) { initialize() };
      geocoder = new google.maps.Geocoder();
      var latlng = new google.maps.LatLng(center_latitude, center_longitude);
      var mapOptions = {
        zoom: 12,
        center: latlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
      }
      geocoder.geocode( { 'address': address}, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
          map.setCenter(results[0].geometry.location);
          var marker = new google.maps.Marker({
              map: map,
              draggable:true, // animate
              animation: google.maps.Animation.DROP,  // animate
              position: results[0].geometry.location
          });
        } else {
           alert('Geocode was not successful for the following reason: ' + status);
        }
        markers.push(marker);
        markers = _.uniq(markers);
        console.log("markers length: ", markers.length)
      });
    }

    function toggleBounce() {  // animate function
      if (marker.getAnimation() != null) {
        marker.setAnimation(null);
      } else {
        marker.setAnimation(google.maps.Animation.BOUNCE);
      }
    } // end animate function

  }
});

