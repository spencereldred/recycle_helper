###################### GROUPS ######################
@public_group = Group.create(name: "Admin", url: "admin.com", description: "Oversees all.", promo_code: "admin")
@public_group = Group.create(name: "Public", url: "public.com", description: "No group.", promo_code: "public")
@air_patrol_group = Group.create(name: "Maui Civil Air Patrol", url: "mcap.com", description: "First group, numero uno!", promo_code: "patrol")

###################### ADMIN USERS ######################
### ADMINS have 15 mile radius
### ANNIE COLLOPY
@super_admin1 = User.create(username: "super_admin1", email: "anniecollopy@gmail.com", phone: "8082807436",
  function: "super_admin", first_name: "Gene", last_name: "Washington", group_id: @public_group.id,
  password: "password", password_confirmation: "password", radius: 15,
  address: "85 Onehee Avenue", city: "Kahului", state: "HI", zipcode: "96732")
sleep(1)
@air_patrol_admin1 = User.create(username: "cap_admin1", email: "anniecollopy@gmail.com", phone: "8082807436",
  function: "admin", first_name: "Ken", last_name: "Willard", group_id: @air_patrol_group.id,
  password: "password", password_confirmation: "password", radius: 15,
  address: "2741 Leolani Place", city: "Makawao", state: "HI", zipcode: "96768")
sleep(1)
### SPENCER ELDRED
@super_admin2 = User.create(username: "super_admin2", email: "eldredspencer@gmail.com", phone: "8082803758",
  function: "super_admin", first_name: "Gene", last_name: "Washington", group_id: @public_group.id,
  password: "password", password_confirmation: "password", radius: 15,
  address: "85 Onehee Avenue", city: "Kahului", state: "HI", zipcode: "96732")
sleep(1)
@air_patrol_admin2 = User.create(username: "cap_admin2", email: "eldredspencer@gmail.com", phone: "8082803758",
  function: "admin", first_name: "Ken", last_name: "Willard", group_id: @air_patrol_group.id,
  password: "password", password_confirmation: "password", radius: 15,
  address: "2741 Leolani Place", city: "Makawao", state: "HI", zipcode: "96768")
sleep(1)

###################### MAKAWAO USERS #########################################
### USERS have 8 mile radius
@makawao1 = User.create(username: "makawao1", email: "eldredspencer@gmail.com", phone: "8082803758",
  function: "recycler", first_name: "Willie", last_name: "Mays", group_id: @air_patrol_group.id,
  password: "password", password_confirmation: "password", radius: 8,
  address: "183 Pukulani St.", city: "Makawao", state: "HI", zipcode: "96768")
sleep(1)

@makawao2 = User.create(username: "makawao2", email: "eldredspencer@gmail.com ", phone: "8082803758",
  function: "recycler", first_name: "Willie", last_name: "McCovey", group_id: @air_patrol_group.id,
  password: "password", password_confirmation: "password",radius: 8,
  address: "200 Haulani St.", city: "Makawao", state: "HI", zipcode: "96768")
sleep(1)

@makawao3 = User.create(username: "makawao3", email: "anniecollopy@gmail.com", phone: "8082807436",
  function: "recycler", first_name: "Juan", last_name: "Marchial", group_id: @air_patrol_group.id,
  password: "password", password_confirmation: "password",radius: 8,
  address: "296 Liholani St.", city: "Makawao", state: "HI", zipcode: "96768")
sleep(1)

@makawao4 = User.create(username: "makawao4", email: "eldredspencer@gmail.com", phone: "8082803758",
  function: "recycler", first_name: "Orlando", last_name: "Cepeda", group_id: @public_group.id,
  password: "password", password_confirmation: "password", radius: 8,
  address: "2942 Aina Lani St.", city: "Makawao", state: "HI", zipcode: "96768")
sleep(1)

@makawao5 = User.create(username: "makawao5", email: "anniecollopy@gmail.com", phone: "8082807436",
  function: "recycler", first_name: "Gaylord", last_name: "Perry", group_id: @public_group.id,
  password: "password", password_confirmation: "password", radius: 8,
  address: "348 Nalani St.", city: "Makawao", state: "HI", zipcode: "96768")
sleep(1)

@makawao6 = User.create(username: "makawao6", email: "eldredspencer@gmail.com", phone: "8082803758",
  function: "redeemer", first_name: "John", last_name: "Brodie", group_id: @air_patrol_group.id,
  password: "password", password_confirmation: "password", radius: 8,
  address: "2741 Leolani Place", city: "Makawao", state: "HI", zipcode: "96768")
sleep(1)

@makawao7 = User.create(username: "makawao7", email: "anniecollopy@gmail.com", phone: "8082807436",
  function: "redeemer", first_name: "John", last_name: "Brodie", group_id: @air_patrol_group.id,
  password: "password", password_confirmation: "password", radius: 8,
  address: "2741 Leolani Place", city: "Makawao", state: "HI", zipcode: "96768")
sleep(1)

###################### MAKAWAO TRANSACTIONS #########################################
@makawao_transaction1 = Transaction.create(recycler_user_id: @makawao1.id, plastic: "1", glass: "1", cans: "1", other: "1",
    address: "183 Pukulani St.", city: "Makawao", state: "HI", zipcode: "96768",
    selected: false, completed: false, trans_type: "redeemable", group_id: @air_patrol_group.id)
sleep(1)

@makawao_transaction2 = Transaction.create(recycler_user_id: @makawao2.id, plastic: "2", glass: "2", cans: "2", other: "2",
    address: "200 Haulani St.", city: "Makawao", state: "HI", zipcode: "96768",
    selected: false, completed: false, trans_type: "redeemable", group_id: @air_patrol_group.id)
sleep(1)

@makawao_transaction3 = Transaction.create(recycler_user_id: @makawao3.id, plastic: "3", glass: "3", cans: "3", other: "3",
    address: "296 Liholani St.", city: "Makawao", state: "HI", zipcode: "96768",
    selected: false, completed: false, trans_type: "redeemable", group_id: @air_patrol_group.id)
sleep(1)

@makawao_transaction4 = Transaction.create(recycler_user_id: @makawao4.id, plastic: "4", glass: "4", cans: "4", other: "4",
    address: "2942 Aina Lani St.", city: "Makawao", state: "HI", zipcode: "96768",
    selected: false, completed: false, trans_type: "redeemable", group_id: @public_group.id)
sleep(1)

@makawao_transaction5 = Transaction.create(recycler_user_id: @makawao5.id, plastic: "5", glass: "5", cans: "5", other: "5",
    address: "348 Nalani St.", city: "Makawao", state: "HI", zipcode: "96768",
    selected: false, completed: false, trans_type: "redeemable", group_id: @public_group.id)
sleep(1)


###################### KAHULUI USERS #########################################
### USERS have 8 mile radius
@kahului1 = User.create(username: "kahului1", email: "eldredspencer@gmail.com", phone: "8082803758",
  function: "recycler", first_name: "Willie", last_name: "Mays", group_id: @air_patrol_group.id,
  password: "password", password_confirmation: "password", radius: 8,
  address: "34 Ani Street", city: "Kahului", state: "HI", zipcode: "96732")
sleep(1)

@kahului2 = User.create(username: "kahului2", email: "eldredspencer@gmail.com ", phone: "8082803758",
  function: "recycler", first_name: "Willie", last_name: "McCovey", group_id: @air_patrol_group.id,
  password: "password", password_confirmation: "password", radius: 8,
  address: "55 Molokai Akau Street", city: "Kahului", state: "HI", zipcode: "96732")
sleep(1)

@kahului3 = User.create(username: "kahului3", email: "anniecollopy@gmail.com", phone: "8082807436",
  function: "recycler", first_name: "Juan", last_name: "Marchial", group_id: @air_patrol_group.id,
  password: "password", password_confirmation: "password", radius: 8,
  address: "85 Niihau Street", city: "Kahului", state: "HI", zipcode: "96732")
sleep(1)

@kahului4 = User.create(username: "kahului4", email: "eldredspencer@gmail.com", phone: "8082803758",
  function: "recycler", first_name: "Orlando", last_name: "Cepeda", group_id: @public_group.id,
  password: "password", password_confirmation: "password", radius: 8,
  address: "85 Kaikai Street", city: "Wailuku", state: "HI", zipcode: "96793")
sleep(1)

@kahului5 = User.create(username: "kahului5", email: "anniecollopy@gmail.com", phone: "8082807436",
  function: "recycler", first_name: "Gaylord", last_name: "Perry", group_id: @public_group.id,
  password: "password", password_confirmation: "password", radius: 8,
  address: "55 Olena Street", city: "Wailuku", state: "HI", zipcode: "96793")
sleep(1)

@kahului6 = User.create(username: "kahului6", email: "eldredspencer@gmail.com", phone: "8082803758",
  function: "redeemer", first_name: "Buster", last_name: "Posey", group_id: @air_patrol_group.id,
  password: "password", password_confirmation: "password", radius: 8,
  address: "85 Onehee Avenue", city: "Kahului", state: "HI", zipcode: "96732")
sleep(1)

@kahului7 = User.create(username: "kahului7", email: "anniecollopy@gmail.com", phone: "8082807436",
  function: "redeemer", first_name: "Buster", last_name: "Posey", group_id: @air_patrol_group.id,
  password: "password", password_confirmation: "password", radius: 8,
  address: "85 Onehee Avenue", city: "Kahului", state: "HI", zipcode: "96732")
sleep(1)

###################### KAHULUI TRANSACTIONS #########################################
@kahului_transaction1 = Transaction.create(recycler_user_id: @kahului1.id, plastic: "1", glass: "1", cans: "1", other: "1",
    address: "34 Ani Street", city: "Kahului", state: "HI", zipcode: "96732",
    selected: false, completed: false, trans_type: "redeemable", group_id: @air_patrol_group.id)
sleep(1)

@kahului_transaction2 = Transaction.create(recycler_user_id: @kahului2.id, plastic: "2", glass: "2", cans: "2", other: "2",
    address: "55 Molokai Akau Street", city: "Kahului", state: "HI", zipcode: "96732",
    selected: false, completed: false, trans_type: "redeemable", group_id: @air_patrol_group.id)
sleep(1)

@kahului_transaction3 = Transaction.create(recycler_user_id: @kahului3.id, plastic: "3", glass: "3", cans: "3", other: "3",
    address: "85 Niihau Street", city: "Kahului", state: "HI", zipcode: "96732",
    selected: false, completed: false, trans_type: "redeemable", group_id: @air_patrol_group.id)
sleep(1)

@kahului_transaction4 = Transaction.create(recycler_user_id: @kahului4.id, plastic: "4", glass: "4", cans: "4", other: "4",
    address: "85 Kaikai Street", city: "Wailuku", state: "HI", zipcode: "96793",
    selected: false, completed: false, trans_type: "redeemable", group_id: @public_group.id)
sleep(1)

@kahului_transaction5 = Transaction.create(recycler_user_id: @kahului5.id, plastic: "5", glass: "5", cans: "5", other: "5",
    address: "55 Olena Street", city: "Wailuku", state: "HI", zipcode: "96793",
    selected: false, completed: false, trans_type: "redeemable", group_id: @public_group.id)
sleep(1)
