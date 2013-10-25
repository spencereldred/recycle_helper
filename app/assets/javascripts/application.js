// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
var map;
$(function(){
        var geocoder;
        function initialize() {
          window.mapWasInitialized = true;
          geocoder = new google.maps.Geocoder();
          var latlng = new google.maps.LatLng(20.798, -156.333);
          var mapOptions = {
            zoom: 10,
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
            zoom: 10,
            center: latlng,
            mapTypeId: google.maps.MapTypeId.ROADMAP
          }
          // var address = document.getElementById('address').value;
          geocoder.geocode( { 'address': address}, function(results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
              map.setCenter(results[0].geometry.location);
              var marker = new google.maps.Marker({
                  map: map,
                  position: results[0].geometry.location
              });
            } else {
               alert('Geocode was not successful for the following reason: ' + status);
            }
          });
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