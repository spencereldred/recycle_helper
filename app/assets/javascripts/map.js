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

    if(!window.mapWasInitialized) { initialize() };
    geocoder = new google.maps.Geocoder();
    var latlng = new google.maps.LatLng(center_latitude, center_longitude);
    var mapOptions = {
      zoom: 12,
      center: latlng,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    // var address = document.getElementById('address').value;
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
         // alert('Geocode was not successful for the following reason: ' + status);
      }
      markers.push(marker);
    });

    function toggleBounce() {  // animate function
      if (marker.getAnimation() != null) {
        marker.setAnimation(null);
      } else {
        marker.setAnimation(google.maps.Animation.BOUNCE);
      }
    } // end animate function

    // Sets the map on all markers in the array.
    function setAllMap(map) {
      for (var i = 0; i < markers.length; i++) {
        console.log("Inside setAllMap().")
        markers[i].setMap(map);
      }
    }

    // Removes the markers from the map, but keeps them in the array.
    function clearMarkers() {
      console.log("Clearing markers.")
      setAllMap(null);
    }

    // Shows any markers currently in the array.
    function showMarkers() {
      console.log("Restoring markers.")
      setAllMap(map);
    }

  }



// google.maps.event.addDomListener(window, 'load', initialize);

 $(function(){

  $('#draw_map').on('click', function(){
       val = $('#addr').val();
       // $('#output1').html("your text here");
       // $('#output2').html(val);
       codeAddress(val);

  });

  });

});

