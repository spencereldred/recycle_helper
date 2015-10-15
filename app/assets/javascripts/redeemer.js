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

app.controller('RedeemerController', ['$scope', '$resource', 'Redeemer',
  function($scope, $resource, Redeemer){
    console.log("Made it to the RedeemerController");

    var center_latitude = $('#center_latitude').val(),
        center_longitude = $('#center_longitude').val(),
        user_radius = $('#current_user_radius').val() * 1609.34,
        // user_radius = 5 * 1609.34,
        current_user_id = parseInt($('#current_user_id').val()),
        addresses = [],  markers = [],
        map, geocoder
        $scope.transactions = [];

    // The callback function from Redeemer.query loads the page with
    // transactions from the database.
    // Adds markers on the map for the transactions already selected.
    $scope.update_trans = function (data) {
      var address, i,length, transaction;
      for (i = 0, length = data.length; i < length; i++) {
        if (!data[i].completed) {
          $scope.transactions.push(data[i])
        }
      }
      console.log("update_trans- $scope.transactions: %O", $scope.transactions);
      for (i = 0, length = $scope.transactions.length; i < length; i++) {
        transaction = $scope.transactions[i];
        if ((transaction.selected && !transaction.completed && transaction.redeemer_user_id === current_user_id) || !transaction.selected) {
          address = transaction["address"] + ", " + transaction["city"] + " " + transaction["state"];
          addMarker(address, "no-op", transaction);
        }
      }
    };

    // Asynchronously calls the RedeemerController to retrieve the
    // transactions within a 20 mile radius of the Redeemer.
    Redeemer.query($scope.update_trans);

    // Adds a marker to the map.
    // Calls the google map routine to place the marker
    // with the address passed in.
    // $scope.add_marker = function (address,action,transaction) {
    //   addMarker(address,action,transaction);

    // };

    // The Redeemer selects an item to recycle.
    // Sets { selected: true, selection_date: new Date() }
    // Places a pin on the map at the location for recycle pickup by
    // calling add_marker(address) with the address of the Recycler.
    $scope.select = function () {
      console.log("Redeemer - select");
      var transaction, address;
      transaction = this.transaction;
      transaction.selected = true;
      transaction.selection_date = new Date();
      transaction.redeemer_user_id = current_user_id;
      address = transaction["address"] + ", " + transaction["city"] + " " + transaction["state"];
      addMarker(address,"no-op",transaction);
      transaction.$update();
    };

    // The Redeemer unselects an item to recycle
    // sets { selected: false, selection_date: "nil" }
    // TODO - Fire off a email to the "recycler" that the job has been unselected?
    $scope.unselect = function () {
      console.log("Redeemer - unselect");
      var transaction, address,i, length;
      transaction = this.transaction;
      transaction.selection_date = $('#unselection_date').val();
      transaction.redeemer_user_id = "nil";
      transaction.selected = false;
      addMarker(address,"delete",transaction);
      for (i = 0, length = $scope.transactions.length; i < length; i++) {
        transaction = $scope.transactions[i];
        if ((transaction.selected && !transaction.completed && transaction.redeemer_user_id === current_user_id) || !transaction.selected) {
          address = transaction["address"] + ", " + transaction["city"] + " " + transaction["state"];
          addMarker(address, "no-op", transaction);
        }
      }
      transaction.$update()
    };

    // Redeemer indicates that the job is complete by checking the "completed"
    // checkbox. Removes the map marker for this item from the map.
    // TODO - fire off an action mail to recycler indicating "redeemer" says the job is done
    $scope.completed = function () {
      console.log("Redeemer - completed");
      var transaction, address, indexToRemove, i, length;
      // update transaction
      transaction = this.transaction;
      transaction.completion_date = new Date();
      transaction.completed = true;
      transaction.$update();
      // redraw markers on map
      addMarker(address,"delete",transaction);
      for (i = 0, length = $scope.transactions.length; i < length; i++) {
        transaction = $scope.transactions[i];
        if ((transaction.selected && !transaction.completed && transaction.redeemer_user_id === current_user_id) || !transaction.selected) {
          address = transaction["address"] + ", " + transaction["city"] + " " + transaction["state"];
          addMarker(address, "no-op", transaction);
        }
      }
    };

    function initialize() {// start initialize
      window.mapWasInitialized = true;
      geocoder = new google.maps.Geocoder();
      var latlng = new google.maps.LatLng(center_latitude, center_longitude);
      var mapOptions = {
        zoom: 12,
        center: latlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
      };
      map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
    };// end initialize

    window.addMarker = function(address,todo,transaction) { // start addMarker
      var i, length, latlng, marker, infoString, infoWindow, selectStatus, iconColor;
      if (todo =="delete") { // remove all the markers
        for (i = 0, length = markers.length; i < length; i++) {
          markers[i].setMap(null);
        }
        markers = [];
      } else {
        if(!window.mapWasInitialized) { initialize() };
        selectStatus = transaction.selected ? "Selected" : "Available";
        if (transaction.selected) {
          selectStatus = "Selected";
          iconColor = 'http://maps.google.com/mapfiles/ms/icons/green-dot.png';
        } else {
          selectStatus = "Available";
          iconColor = 'http://maps.google.com/mapfiles/ms/icons/blue-dot.png';
        }
        geocoder = new google.maps.Geocoder();
        latlng = new google.maps.LatLng(center_latitude, center_longitude);
        drawUserCircleOnMap(map,latlng,user_radius);

        geocoder.geocode( { 'address': address}, function(results, status) {
          if (status == google.maps.GeocoderStatus.OK) {
            map.setCenter(results[0].geometry.location);
            marker = new google.maps.Marker({
                map: map,
                icon: iconColor,
                title: selectStatus,
                draggable:true, // animate
                animation: google.maps.Animation.DROP,  // animate
                position: results[0].geometry.location
            });
            infoString = createInfoBoxString(address,transaction);
            infoWindow = new google.maps.InfoWindow({
              content: infoString
            });
            marker.addListener('click', function () {
              infoWindow.open(map,marker);
            });
          } else {
             alert('Geocode was not successful for the following reason: ' + status);
          }
          if (markers.indexOf(marker) === -1) {
            markers.push(marker);
          }
        });
      }; // end addMarker

      function toggleBounce() { // start toggleBounce
        if (marker.getAnimation() != null) {
          marker.setAnimation(null);
        } else {
          marker.setAnimation(google.maps.Animation.BOUNCE);
        }
      }; // end toggleBounce

      // function hello () {
      //   console.log("button in infoBox actually works!!");
      // };

      function drawUserCircleOnMap(map,latlng,user_radius) {
        var userCircle = new google.maps.Circle({
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 2,
          fillColor: '#FF0000',
          fillOpacity: 0.025,
          map: map,
          center: latlng,
          radius: user_radius
        });
      };

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
        // infoBoxString += "<button onclick='hello'>Completed</button>";

        return infoBoxString;
      }; // end createInfoBoxString

    }


  }
]);


  // # The callback function loads the page with transactions from the database.
  // # Adds markers on the map for the transactions already selected.
  // $scope.update_trans = (data)=>
  //   $scope.transactions = data
  //   for transaction in $scope.transactions when transaction.selected == true && transaction.completed == false && transaction.redeemer_user_id == current_user_id
  //     console.log transaction.redeemer_user_id, current_user_id
  //     address = transaction["address"] + ", " + transaction["city"] + " " + transaction["state"]
  //     console.log address
  //     addMarker(address)


