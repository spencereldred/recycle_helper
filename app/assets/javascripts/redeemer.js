// ######################################################
// ################# RedeemerController #################
// ######################################################

// ################# Directives #################
app.directive("redeemable", [function() {
  return {
    restrict: "E",
    template: "<h1>Available Redeemable Transactions</h1>"
  }
}]);
app.directive("samaritan", [function() {
  return {
    restrict: "E",
    template: "<h1>Available Good Samaritan Transactions</h1>"
  }
}]);
app.directive("redeemableselected", [function() {
  return {
    restrict: "E",
    template: "<h1>Redeemable Transactions Selected</h1>"
  }
}]);
app.directive("samaritanselected", [function() {
  return {
    restrict: "E",
    template: "<h1>Good Samaritan Transactions Selected</h1>"
  }
}]);


// ################# Routes #####################
app.factory('Redeemer', ['$resource', function($resource){
  return $resource('/redeemers/:id.json', {id: '@id'}, {update: {method: 'PUT'}});
}]);

app.controller('RedeemerController', ['$scope', '$resource', 'Redeemer', '$timeout', '$interval',
  function($scope, $resource, Redeemer, $timeout, $interval){
    console.log("Made it to the RedeemerController");

    var center_latitude = $('#center_latitude').val(),
        center_longitude = $('#center_longitude').val(),
        user_radius = $('#current_user_radius').val() * 1609.34,
        current_user_id = parseInt($('#current_user_id').val()),
        addresses = [],  markers = [],
        map, geocoder;
        $scope.transactions = [];

    var updateTransaction = function (transaction) { // start updateTransaction
      transaction.$update().then(function () {
        console.log("update transaction");
        Redeemer.query($scope.update_trans);
      });
    }; // end updateTransaction

    $scope.update_trans = function (data) { // start update_trans
      var address, i,length, transaction;
      $scope.transactions = [];
      for (i = 0, length = data.length; i < length; i++) {
        if (!data[i].completed) {
          $scope.transactions.push(data[i]);
        }
      }
      addMarker(address,"delete",transaction);
      console.log("update_trans- $scope.transactions: %O", $scope.transactions);
      for (i = 0, length = $scope.transactions.length; i < length; i++) {
        transaction = $scope.transactions[i];
        if ((transaction.selected && !transaction.completed && transaction.redeemer_user_id === current_user_id) || !transaction.selected) {
          address = transaction["address"] + ", " + transaction["city"] + " " + transaction["state"];
          addMarker(address, "no-op", transaction);
        }
      }
    };// end update_trans

    Redeemer.query($scope.update_trans);

    var updateInterval = 5 * 60 * 1000; // 5 minutes
    $interval(function () {
        console.log("interval - update transactions");
        Redeemer.query($scope.update_trans);
    }, updateInterval); //

    $scope.select = function () { // start select
      console.log("Redeemer - select");
      var transaction, address;
      transaction = this.transaction;
      transaction.selected = true;
      transaction.selection_date = new Date();
      transaction.redeemer_user_id = current_user_id;
      updateTransaction(transaction);
    }; // end select

    $scope.unselect = function () { // start unselect
      console.log("Redeemer - unselect");
      var transaction, address,i, length;
      transaction = this.transaction;
      transaction.selection_date = $('#unselection_date').val();
      transaction.redeemer_user_id = "nil";
      transaction.selected = false;
      updateTransaction(transaction);
    };// end unselect

    $scope.completed = function () { // start completed
      console.log("Redeemer - completed");
      var transaction, address, indexToRemove, i, length;
      transaction = this.transaction;
      transaction.completion_date = new Date();
      transaction.completed = true;
      updateTransaction(transaction);
    }; // end completed

    function drawUserCircleOnMap(map,latlng,user_radius) { // start drawUserCircleOnMap
        var userCircle = new google.maps.Circle({
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 2,
          fillColor: '#FF0000',
          fillOpacity: 0.015,
          map: map,
          center: latlng,
          radius: user_radius
        });
      };// end drawUserCircleOnMap

    function initialize() {// start initialize
      var latlng = new google.maps.LatLng(center_latitude, center_longitude);
      var mapOptions = {
        zoom: 12,
        center: latlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
      };
      map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
      drawUserCircleOnMap(map, latlng, user_radius);
    };// end initialize
    initialize();

    function addMarker(address,todo,transaction) { // start addMarker
      var i, length, markerLatLng, marker, centerLatLng,
          infoString, infoWindow, selectStatus, iconColor;
      centerLatLng = null;
      if (todo =="delete") { // remove all the markers
        for (i = 0, length = markers.length; i < length; i++) {
          markers[i].setMap(null);
        }
        markers = [];
      } else {
        selectStatus = transaction.selected ? "Selected" : "Available";
        if (transaction.selected) {
          selectStatus = "Selected";
          iconColor = 'http://maps.google.com/mapfiles/ms/icons/green-dot.png';
        } else {
          selectStatus = "Available";
          iconColor = 'http://maps.google.com/mapfiles/ms/icons/blue-dot.png';
        }
        if (!centerLatLng) {
          centerLatLng = new google.maps.LatLng(center_latitude, center_longitude);
          map.setCenter(centerLatLng);
          drawUserCircleOnMap(map, centerLatLng, user_radius);
        }
        markerLatLng = new google.maps.LatLng(transaction.latitude, transaction.longitude);
        marker = new google.maps.Marker({
            map: map,
            icon: iconColor,
            title: selectStatus,
            draggable:true, // animate
            animation: google.maps.Animation.DROP,  // animate
            position: markerLatLng
        });
        infoString = createInfoBoxString(address,transaction);
        infoWindow = new google.maps.InfoWindow({
          content: infoString
        });
        marker.addListener('click', function () {
          infoWindow.open(map,marker);
        });
        if (markers.indexOf(marker) === -1) {
          markers.push(marker);
        }
      }; // end addMarker

      function toggleBounce() { // start toggleBounce
        if (marker.getAnimation() != null) {
          marker.setAnimation(null);
        } else {
          marker.setAnimation(google.maps.Animation.BOUNCE);
        }
      }; // end toggleBounce

      function drawUserCircleOnMap(map,latlng,user_radius) { // start drawUserCircleOnMap
        var userCircle = new google.maps.Circle({
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 2,
          fillColor: '#FF0000',
          fillOpacity: 0.015,
          map: map,
          center: latlng,
          radius: user_radius
        });
      };// end drawUserCircleOnMap

      function createInfoBoxString (address, transaction) { // start createInfoBoxString
        var infoBoxString = "";
        if (transaction.selected) {
          infoBoxString += "<p>Hi5Exchange Transaction Selected.<p>";
        } else {
          infoBoxString += "<p>Hi5Exchange Transaction Available.<p>";
        }
        infoBoxString += "<p>" + address + "<p>";
        infoBoxString += "<p>Plastic: " + transaction.plastic + ", Cans: " + transaction.cans;
        infoBoxString += ", Glass: " + transaction.glass + ", Mixed Hi5: " + transaction.other + "<p>";
        infoBoxString += "<p>Miles from home: " + (transaction.distance * 1).toFixed(2) + "<p>";
        return infoBoxString;
      }; // end createInfoBoxString

    }

  }
]);
