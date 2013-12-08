app = angular.module("Hi5Exchange", ["ngResource"])

#########################################################
################# TransactionController #################
#########################################################

################# Directives #################
app.directive "new", () ->
  restrict: "E",
  template: "New Transaction for "

################# Routes #####################
app.factory "Transaction", ($resource) ->
  $resource("/transactions/:id.json", {id: "@id"}, {update: {method: "PUT"}})

@TransactionController = ($scope, Transaction) ->
  console.log "Made it to the TransactionController"

  $scope.update_trans = (data)=>
    $scope.transactions = data

  Transaction.query $scope.update_trans

  $scope.bag_options = [
    {name: "none", value: "none"},
    {name: "1 bag", value: "1 bag"},
    {name: "2 bags", value: "2 bags"},
    {name: "3 bags", value: "3 bags"},
    {name: "4 bags", value: "4 bags"},
    {name: "5 bags", value: "5 bags"},
    {name: "6 bags", value: "6 bags"},
    {name: "7 bags", value: "7 bags"}
  ]

  $scope.other_options = [
    {name: "cardboard", value: "cardboard"},
    {name: "plastic", value: "plastic"},
    {name: "glass", value: "glass"},
    {name: "cans", value: "cans"},
    {name: "other", value: "other"}
  ]

  # Recycler creates a transaction and saves it to the database.
  # The transaction is added to the view.
  $scope.new_recycle_item = ->
    console.log "add recycle item button was clicked"
    if @transaction
      transaction = @transaction
      transaction.address = $('#user_address').val()
      transaction.city = $('#user_city').val()
      transaction.state = $('#user_state').val()
      transaction.zipcode = $('#user_zipcode').val()
      transaction.recycler_user_id = $('#user_id').val()
      transaction.completion_date = "nil"
      transaction.selected = false
      transaction.completed = false
      $scope.transactions.push(transaction)
      console.log transaction

      Transaction.save(transaction)

      # transaction.save()

  # Recycler marks the transaction as completed.
  # Sets { completed: true, completion_date: new Date() }
  # The transaction is removed from the view by a filter.
  # The view only shows transactions where "filter: { completed: false}"."
  $scope.completed = ->
    transaction = @transaction
    transaction.completion_date = new Date()
    transaction.completed = true
    transaction.$update()

######################################################
################# RedeemerController #################
######################################################

################# Directives #################
app.directive "all", () ->
  restrict: "E",
  template: "<h1>All Available</h1>"

################# Routes #####################
app.factory "Redeemer", ($resource) ->
  $resource("/redeemers/:id.json", {id: "@id"}, {update: {method: "PUT"}})

@RedeemerController = ($scope, Redeemer) ->
  console.log "Made it to the RedeemerController"
  center_latitude = $('#center_latitude').val()
  center_longitude = $('#center_longitude').val()
  addresses = []

  # The callback function loads the page with transactions from the database.
  # Adds markers on the map for the transactions already selected.
  $scope.update_trans = (data)=>
    $scope.transactions = data
    for transaction in $scope.transactions when transaction.selected == true && transaction.completed == false
      address = transaction["address"] + ", " + transaction["city"] + " " + transaction["state"]
      $scope.add_marker(address)

  # Asynchronously calls the RedeemerController to retrieve the
  # transactions within a 20 mile radius of the Redeemer.
  Redeemer.query $scope.update_trans

  # Adds a marker to the map.
  # Calls the google map routine with the address passed in.
  $scope.add_marker = (address,action) ->
    codeAddress(address,action)
    addresses.push(address) unless action == "delete"
    addresses = _.uniq(addresses)


  # The Redeemer selects an item to recycle.
  # Sets { selected: true, selection_date: new Date() }
  # Places a pin on the map at the location for recycle pickup by
  # calling add_marker(address) with the address of the Recycler.
  $scope.select = ->
    transaction = @transaction
    # transaction.selected = true
    transaction.selection_date = new Date()
    address = transaction["address"] + ", " + transaction["city"] + " " + transaction["state"]
    $scope.add_marker(address)
    transaction.$update()

  # The Redeemer unselects an item to recycle
  # sets { selected: false, selection_date: "nil" }
  $scope.unselect = ->
    # console.log "unselect()"
    transaction = @transaction
    # for address in addresses
    #   console.log "before delete",   address
    # console.log transaction.address, addresses.length
    transaction.selection_date = $('#unselection_date').val()
    address = transaction["address"] + ", " + transaction["city"] + " " + transaction["state"]
    addresses = _.reject(addresses, (addr) ->
      address == addr
    )
    $scope.add_marker(address,"delete")
    # console.log address, addresses.length
    for address in addresses
      # console.log "after delete", address
      $scope.add_marker(address)

    transaction.$update()



