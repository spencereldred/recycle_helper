# create angular module application - "Redeemers"
# redeemerApp = angular.module("Redeemers", ["ngResource"])

# redeemerApp.factory "User", ($resource) ->
#   $resource("/redeemers/:id", {id: "@id"}, {update: {method: "PUT"}})

# redeemerApp.directive "all", () ->
#   restrict: "E",
#   template: "<h1>All Available</h1>"

# @RedeemerController = ($scope, User) ->
#   console.log "Made it to the controller"
#   # Redeemer = $resource("/redeemers/:id.json", {id: @id}, {update: {method: "PUT"}})
#   $scope.redeemers = User.query()
#   $scope.users = [
#     {id: 1, username: "recycler1", email: "spencereldred@gmail.com", phone: "8082803758",
#     function: "recycler", first_name: "Willie", last_name: "Mays",
#     password: "recycler1",password_confirmation: "recycler1",
#     address: "183 Pukulani St.", city: "Makawao", state: "HI", zipcode: "96768" },

#     {id: 2, username: "recycler2", email: "spencereldred@gmail.com", phone: "8082803758",
#     function: "recycler", first_name: "Willie", last_name: "McCovey",
#     password: "recycler2",password_confirmation: "recycler2",
#     address: "2841 Iolani St.", city: "Makawao", state: "HI", zipcode: "96768" },

#     {id: 3, username: "recycler3", email: "spencereldred@gmail.com", phone: "8082803758",
#     function: "recycler", first_name: "Juan", last_name: "Marchial",
#     password: "recycler3",password_confirmation: "recycler3",
#     address: "296 Liholani St.", city: "Makawao", state: "HI", zipcode: "96768" },

#     {id: 4, username: "recycler4", email: "spencereldred@gmail.com", phone: "8082803758",
#     function: "recycler", first_name: "Orlando", last_name: "Cepeda",
#     password: "recycler4",password_confirmation: "recycler4",
#     address: "2942 Aina Lani St.", city: "Makawao", state: "HI", zipcode: "96768" },

#     {id: 5, username: "recycler5", email: "spencereldred@gmail.com", phone: "8082803758",
#     function: "recycler", first_name: "Gaylord", last_name: "Perry",
#     password: "recycler5",password_confirmation: "recycler5",
#     address: "348 Nalani St.", city: "Makawao", state: "HI", zipcode: "96768" },

#     {id: 6, username: "recycler6", email: "spencereldred@gmail.com", phone: "8082803758",
#     function: "recycler", first_name: "Jack", last_name: "Clark",
#     password: "recycler6",password_confirmation: "recycler6",
#     address: "414 Brannan St.", city: "San Francisco", state: "CA", zipcode: "94107" },

#     {id: 7, username: "redeemer1", email: "spencereldred@gmail.com", phone: "8082803758",
#     function: "redeemer", first_name: "John", last_name: "Brodie",
#     password: "redeemer1",password_confirmation: "redeemer1",
#     address: "2741 Leolani Place", city: "Makawao", state: "HI", zipcode: "96768" },

#     {id: 8, username: "redeemer2", email: "spencereldred@gmail.com", phone: "8082803758",
#     function: "redeemer", first_name: "Ken", last_name: "Willard",
#     password: "redeemer2",password_confirmation: "redeemer2",
#     address: "2741 Leolani Place", city: "Makawao", state: "HI", zipcode: "96768" },

#     {id: 9, username: "redeemer3", email: "spencereldred@gmail.com", phone: "8082803758",
#     function: "redeemer", first_name: "Jerry", last_name: "Rice",
#     password: "redeemer3",password_confirmation: "redeemer3",
#     address: "268 St. Charles Ave", city: "San Francisco", state: "CA", zipcode: "94132" }
#     ]

#   console.log $scope.users

#   $scope.transactions = [
#     {recycler_user_id: "1", plastic: "1 bag", glass: "1 bag", cans: "1 bag", other: "cardboard",
#     address: "183 Pukulani St.", city: "Makawao", state: "HI", zipcode: "96768", selected: false },

#     {recycler_user_id: "2", plastic: "2 bags", glass: "2 bags", cans: "2 bags", other: "plastic",
#     address: "2841 Iolani St.", city: "Makawao", state: "HI", zipcode: "96768", selected: false },

#     {recycler_user_id: "3", plastic: "3 bags", glass: "3 bags", cans: "3 bags", other: "plastic",
#     address: "296 Liholani St.", city: "Makawao", state: "HI", zipcode: "96768", selected: false },

#     {recycler_user_id: "4", plastic: "4 bags", glass: "4 bags", cans: "4 bags", other: "none",
#     address: "2942 Aina Lani St.", city: "Makawao", state: "HI", zipcode: "96768", selected: true },

#     {recycler_user_id: "5", plastic: "5 bags", glass: "5 bags", cans: "5 bags", other: "glass",
#     address: "348 Nalani St.", city: "Makawao", state: "HI", zipcode: "96768", selected: true },

#     {recycler_user_id: "6", plastic: "6 bags", glass: "6 bags", cans: "6 bags", other: "aluminum",
#     address: "414 Brannan St.", city: "San Francisco", state: "CA", zipcode: "94107", selected: false }
#     ]
#   console.log $scope.transactions

#   $scope.select = ->
#     transaction = @transaction
#     transaction.selection_date = $('#selection_date').val()
#     console.log transaction
#     # transaction.selected = true
#     transaction.$update()

#   $scope.unselect = ->
#     transaction = @transaction
#     transaction.selection_date = $('#unselection_date').val()
#     console.log transaction
#     # transaction.selected = false
#     transaction.$update()


