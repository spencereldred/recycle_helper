###################### GROUPS ######################
@admin_group = Group.create(name: "Admin", url: "admin.com", description: "tbd", promo_code: "admin")
@public_group = Group.create(name: "Public", url: "public.com", description: "Can sign up Public Redeemer", promo_code: "public")
@air_patrol_group = Group.create(name: "Maui Civil Air Patrol", url: "mauicap.org", description: "Maui County Composite Squadron", promo_code: "patrol")
@maui_dolphins = Group.create(name: "Maui Dolphins Swim Club", url: "mauidolphins.org", description: "USA Swimming Team", promo_code: "mauidolphins")

###################### ADMIN USERS ######################
### ADMINS have 15 mile radius
### ANNIE COLLOPY
@annieadmin = User.create(username: "annieadmin", email: "anniecollopy@gmail.com", phone: "8082807436",
  function: "super_admin", first_name: "Jerry", last_name: "Rice", group_id: @public_group.id,
  password: "password", password_confirmation: "password", radius: 15,
  address: "85 Onehee Avenue", city: "Kahului", state: "HI", zipcode: "96732")
sleep(1)
@anniedolphins = User.create(username: "anniedolphins", email: "anniecollopy@gmail.com", phone: "8082807436",
  function: "admin", first_name: "Joe", last_name: "Montana", group_id: @maui_dolphins.id,
  password: "password", password_confirmation: "password", radius: 15,
  address: "2741 Leolani Place", city: "Makawao", state: "HI", zipcode: "96768")
sleep(1)
### SPENCER ELDRED
@spenceradmin = User.create(username: "spenceradmin", email: "eldredspencer@gmail.com", phone: "8082803758",
  function: "super_admin", first_name: "Gene", last_name: "Washington", group_id: @public_group.id,
  password: "password", password_confirmation: "password", radius: 15,
  address: "85 Onehee Avenue", city: "Kahului", state: "HI", zipcode: "96732")
sleep(1)
@spencerdolphins = User.create(username: "spencerdolphins", email: "eldredspencer@gmail.com", phone: "8082803758",
  function: "admin", first_name: "John", last_name: "Brodie", group_id: @maui_dolphins.id,
  password: "password", password_confirmation: "password", radius: 15,
  address: "2741 Leolani Place", city: "Makawao", state: "HI", zipcode: "96768")
sleep(1)

###################### MAKAWAO USERS #########################################
### USERS have 8 mile radius
@annierecycler1 = User.create(username: "annierecycler1", email: "anniecollopy@gmail.com", phone: "8082807436",
  function: "recycler", first_name: "Willie", last_name: "Mays", group_id: @public_group.id,
  password: "password", password_confirmation: "password", radius: 8,
  address: "183 Pukulani St.", city: "Makawao", state: "HI", zipcode: "96768")
sleep(1)

@annierecycler2 = User.create(username: "annierecycler2", email: "anniecollopy@gmail.com", phone: "8082807436",
  function: "recycler", first_name: "Juan", last_name: "Marchial", group_id: @maui_dolphins.id,
  password: "password", password_confirmation: "password",radius: 8,
  address: "296 Liholani St.", city: "Makawao", state: "HI", zipcode: "96768")
sleep(1)

@annieredeemer = User.create(username: "annieredeemer", email: "anniecollopy@gmail.com", phone: "8082807436",
  function: "redeemer", first_name: "Buster", last_name: "Posey", group_id: @maui_dolphins.id,
  password: "password", password_confirmation: "password", radius: 8,
  address: "2741 Leolani Place", city: "Makawao", state: "HI", zipcode: "96768")
sleep(1)


@spencerrecyler1 = User.create(username: "spencerrecyler1", email: "eldredspencer@gmail.com", phone: "8082803758",
  function: "recycler", first_name: "Bobby", last_name: "Bonds", group_id: @public_group.id,
  password: "password", password_confirmation: "password", radius: 8,
  address: "2942 Aina Lani St.", city: "Makawao", state: "HI", zipcode: "96768")
sleep(1)

@spencerrecyler2 = User.create(username: "spencerrecyler2", email: "eldredspencer@gmail.com", phone: "8082803758",
  function: "recycler", first_name: "Gaylord", last_name: "Perry", group_id: @maui_dolphins.id,
  password: "password", password_confirmation: "password", radius: 8,
  address: "348 Nalani St.", city: "Makawao", state: "HI", zipcode: "96768")
sleep(1)

@spencerredeemer = User.create(username: "spencerredeemer", email: "eldredspencer@gmail.com", phone: "8082803758",
  function: "redeemer", first_name: "Willie", last_name: "McCovey", group_id: @maui_dolphins.id,
  password: "password", password_confirmation: "password", radius: 8,
  address: "2741 Leolani Place", city: "Makawao", state: "HI", zipcode: "96768")
sleep(1)


###################### MAKAWAO TRANSACTIONS #########################################
@makawao_trans1 = Transaction.create(recycler_user_id: @annierecycler1.id, plastic: "1", glass: "1", cans: "1", other: "1",
    address: "183 Pukulani St.", city: "Makawao", state: "HI", zipcode: "96768",
    selected: false, completed: false, trans_type: "redeemable", group_id: @public_group.id)
sleep(1)

@makawao_trans3 = Transaction.create(recycler_user_id: @annierecycler2.id, plastic: "3", glass: "3", cans: "3", other: "3",
    address: "296 Liholani St.", city: "Makawao", state: "HI", zipcode: "96768",
    selected: false, completed: false, trans_type: "redeemable", group_id: @maui_dolphins.id)
sleep(1)

@makawao_trans4 = Transaction.create(recycler_user_id: @spencerrecyler1.id, plastic: "4", glass: "4", cans: "4", other: "4",
    address: "2942 Aina Lani St.", city: "Makawao", state: "HI", zipcode: "96768",
    selected: false, completed: false, trans_type: "redeemable", group_id: @public_group.id)
sleep(1)

@makawao_trans5 = Transaction.create(recycler_user_id: @spencerrecyler2.id, plastic: "5", glass: "5", cans: "5", other: "5",
    address: "348 Nalani St.", city: "Makawao", state: "HI", zipcode: "96768",
    selected: false, completed: false, trans_type: "redeemable", group_id: @maui_dolphins.id)
sleep(1)


###################### KAHULUI USERS #########################################
### USERS have 8 mile radius
# @kahului1 = User.create(username: "kahului1", email: "eldredspencer@gmail.com", phone: "8082803758",
#   function: "recycler", first_name: "Willie", last_name: "Mays", group_id: @air_patrol_group.id,
#   password: "password", password_confirmation: "password", radius: 8,
#   address: "34 Ani Street", city: "Kahului", state: "HI", zipcode: "96732")
# sleep(1)

# @kahului2 = User.create(username: "kahului2", email: "eldredspencer@gmail.com ", phone: "8082803758",
#   function: "recycler", first_name: "Willie", last_name: "McCovey", group_id: @air_patrol_group.id,
#   password: "password", password_confirmation: "password", radius: 8,
#   address: "55 Molokai Akau Street", city: "Kahului", state: "HI", zipcode: "96732")
# sleep(1)

# @kahului3 = User.create(username: "kahului3", email: "anniecollopy@gmail.com", phone: "8082807436",
#   function: "recycler", first_name: "Juan", last_name: "Marchial", group_id: @air_patrol_group.id,
#   password: "password", password_confirmation: "password", radius: 8,
#   address: "85 Niihau Street", city: "Kahului", state: "HI", zipcode: "96732")
# sleep(1)

# @kahului4 = User.create(username: "kahului4", email: "eldredspencer@gmail.com", phone: "8082803758",
#   function: "recycler", first_name: "Orlando", last_name: "Cepeda", group_id: @public_group.id,
#   password: "password", password_confirmation: "password", radius: 8,
#   address: "85 Kaikai Street", city: "Wailuku", state: "HI", zipcode: "96793")
# sleep(1)

# @kahului5 = User.create(username: "kahului5", email: "anniecollopy@gmail.com", phone: "8082807436",
#   function: "recycler", first_name: "Gaylord", last_name: "Perry", group_id: @public_group.id,
#   password: "password", password_confirmation: "password", radius: 8,
#   address: "55 Olena Street", city: "Wailuku", state: "HI", zipcode: "96793")
# sleep(1)

# @kahului6 = User.create(username: "kahului6", email: "eldredspencer@gmail.com", phone: "8082803758",
#   function: "redeemer", first_name: "Buster", last_name: "Posey", group_id: @air_patrol_group.id,
#   password: "password", password_confirmation: "password", radius: 8,
#   address: "85 Onehee Avenue", city: "Kahului", state: "HI", zipcode: "96732")
# sleep(1)

# @kahului7 = User.create(username: "kahului7", email: "anniecollopy@gmail.com", phone: "8082807436",
#   function: "redeemer", first_name: "Buster", last_name: "Posey", group_id: @air_patrol_group.id,
#   password: "password", password_confirmation: "password", radius: 8,
#   address: "85 Onehee Avenue", city: "Kahului", state: "HI", zipcode: "96732")
# sleep(1)

###################### KAHULUI TRANSACTIONS #########################################
# K