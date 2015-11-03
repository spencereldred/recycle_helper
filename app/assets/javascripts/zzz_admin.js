// ######################################################
// ################# AdminController #################
// ######################################################

// ################# Directives #################
app.directive("openJobs", [function() {
  return {
    restrict: "E",
    template: "<h1>Open Redeemable Jobs</h1>"
  }
}]);
app.directive("selectedJobs", [function() {
  return {
    restrict: "E",
    template: "<h1>Selected Redeemable Jobs</h1>"
  }
}]);
app.directive("completedJobs", [function() {
  return {
    restrict: "E",
    template: "<h1>Completed Redeemable Jobs</h1>"
  }
}]);

// ################# User #####################

app.factory('User', ['$resource', function($resource){
  return $resource('/users/:id.json', {id: '@id'}, {update: {method: 'PUT'}});
}]);

app.controller('UserController', ['$scope', '$rootScope', '$resource', 'User',
  function($scope, $rootScope, $resource, User){

    var update_users = function (data) {
      $scope.users = data;
    };
    User.query(update_users);

  }
]);

// ################# Transaction #####################

app.factory('Transaction', ['$resource', function($resource){
  return $resource('/transactions/:id.json', {id: '@id'}, {update: {method: 'PUT'}});
}]);

app.controller('TransactionController', ['$scope', '$rootScope', '$resource', 'Transaction',
  function($scope, $rootScope, $resource, Transaction){

    var formatDate = function (date) {
      var dateArray = date.split("T")[0].split("-");
      var timeArray = date.split("T")[1].split(":");
      var dateString = dateArray[1] + "/" + dateArray[2] + "/" + dateArray[0].slice(2,4);
      dateString += " " + timeArray[0]%12 + ":" + timeArray[1];
      dateString += timeArray[0]/12 > 1 ? " PM" : " AM";
      console.log("postDate: %O", dateString);

      return dateString;
    };


    var update_trans = function (data) {
      $scope.transactions = data;
      var i, date,
          length = $scope.transactions.length;
      for (i = 0; i < length; i++) {
        trans = $scope.transactions[i];
        if (trans.created_at) {
          trans.created_at = formatDate(trans.created_at);
        }
        if (trans.selection_date) {
          trans.selection_date = formatDate(trans.selection_date);
        }
        if (trans.completion_date) {
          trans.completion_date = formatDate(trans.completion_date);
        }
      }
    };
    Transaction.query(update_trans);

  }
]);

// ################# Group #####################

app.factory('Group', ['$resource', function($resource){
  return $resource('/groups/:id.json', {id: '@id'}, {update: {method: 'PUT'}});
}]);

app.controller('GroupController', ['$scope', '$rootScope', '$resource', 'Group',
  function($scope, $rootScope, $resource, Group){

    var update_groups = function (data) {
      $scope.groups = data;
    };
    Group.query(update_groups);

  }
]);
