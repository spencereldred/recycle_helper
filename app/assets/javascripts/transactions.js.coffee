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

  ## Grab the transactions from the rails database asychronously
  Transaction.query $scope.update_trans

  $scope.bag_options = [
    {name: "none", value: "0" },
    {name: "1 bag", value: "1" },
    {name: "2 bags", value: "2" },
    {name: "3 bags", value: "3" },
    {name: "4 bags", value: "4" },
    {name: "5 bags", value: "5" },
    {name: "6 bags", value: "6" },
    {name: "7 bags", value: "7" }
  ]

  # Recycler creates a transaction and saves it to the database.
  # The transaction is added to the view.
  $scope.new_recycle_item = ->
    console.log "add recycle item button was clicked"
    # $('#thanks_alert').css('visibility','visible');
    if @transaction
      transaction = @transaction
      #################
      # grab values from the user model stashed in the DOM
      transaction.address = $('#user_address').val()
      transaction.city = $('#user_city').val()
      transaction.state = $('#user_state').val()
      transaction.zipcode = $('#user_zipcode').val()
      transaction.recycler_user_id = $('#user_id').val()
      transaction.completion_date = "nil"
      transaction.selected = false
      transaction.completed = false

      ## Update the scoped 'transactions' array for the view
      $scope.transactions.push(transaction)
      console.log transaction

      ## Update the database via the rails controller 'create' method
      Transaction.save(transaction)

  # Recycler marks the transaction as completed.
  # Sets { completed: true, completion_date: new Date() }
  # The transaction is removed from the view by a filter.
  # The view only shows transactions where "filter: { completed: false}"."
  $scope.remove = ->
    console.log "remove action clicked"
    transaction = @transaction
    transaction.delete

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
  current_user_id = parseInt $('#current_user_id').val()
  addresses = []

  # The callback function loads the page with transactions from the database.
  # Adds markers on the map for the transactions already selected.
  $scope.update_trans = (data)=>
    $scope.transactions = data
    for transaction in $scope.transactions when transaction.selected == true && transaction.completed == false && transaction.redeemer_user_id == current_user_id
      console.log transaction.redeemer_user_id, current_user_id
      address = transaction["address"] + ", " + transaction["city"] + " " + transaction["state"]
      console.log address
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
  # TODO - Fire off an email to the "recycler" that the item has been selected.
  $scope.select = ->
    transaction = @transaction
    # transaction.selected = true
    transaction.selection_date = new Date()
    transaction.redeemer_user_id = current_user_id
    console.log transaction.redeemer_user_id
    address = transaction["address"] + ", " + transaction["city"] + " " + transaction["state"]
    $scope.add_marker(address)
    transaction.$update()

  # The Redeemer unselects an item to recycle
  # sets { selected: false, selection_date: "nil" }
  # TODO - Fire off a email to the "recycler" that the job has been unselected?
  $scope.unselect = ->
    # console.log "unselect()"
    transaction = @transaction
    # for address in addresses
    #   console.log "before delete",   address
    # console.log transaction.address, addresses.length
    transaction.selection_date = $('#unselection_date').val()
    transaction.redeemer_user_id = "nil"
    console.log transaction.redeemer_user_id
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


  # Redeemer indicates that the job is complete by checking the "completed"
  # checkbox. Removes the map marker for this item from the map.
  # TODO - fire off an action mail to recycler indicating "redeemer" says the job is done
  $scope.completed = ->
    transaction = @transaction
    transaction.completion_date = new Date()
    transaction.completed = true
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



