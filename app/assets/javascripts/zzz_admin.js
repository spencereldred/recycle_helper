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

    var update_trans = function (data) {
      $scope.transactions = data;
      var i, date,
          length = $scope.transactions.length;
      for (i = 0; i < length; i++) {
        trans = $scope.transactions[i];
        if (trans.created_at) {
          trans.created_at = $rootScope.formatDate(trans.created_at);
        }
        if (trans.selection_date) {
          trans.selection_date = $rootScope.formatDate(trans.selection_date);
        }
        if (trans.completion_date) {
          trans.completion_date = $rootScope.formatDate(trans.completion_date);
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
