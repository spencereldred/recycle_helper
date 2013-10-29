// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
var map;
$(function(){
        var geocoder;
        function initialize() {
          window.mapWasInitialized = true;
          geocoder = new google.maps.Geocoder();
          var latlng = new google.maps.LatLng(20.798, -156.333);
          var mapOptions = {
            zoom: 12,
            center: latlng,
            mapTypeId: google.maps.MapTypeId.ROADMAP
          }
          map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
        }

        window.codeAddress = function(address) {
          if(!window.mapWasInitialized) { initialize() };
          geocoder = new google.maps.Geocoder();
          var latlng = new google.maps.LatLng(20.798, -156.333);
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
               alert('Geocode was not successful for the following reason: ' + status);
            }
          });

          function toggleBounce() {  // animate function
            if (marker.getAnimation() != null) {
              marker.setAnimation(null);
            } else {
              marker.setAnimation(google.maps.Animation.BOUNCE);
            }
          } // end animate function

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


