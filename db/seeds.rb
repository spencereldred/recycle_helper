# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([
  {username: "recycler1", email: "eldredspencer@gmail.com", phone: "8082803758",
  function: "recycler", first_name: "Willie", last_name: "Mays",
  password: "recycler1",password_confirmation: "recycler1", radius: 5,
  address: "183 Pukulani St.", city: "Makawao", state: "HI", zipcode: "96768" },

   {username: "recycler2", email: "eldredspencer@gmail.com ", phone: "8082803758",
  function: "recycler", first_name: "Willie", last_name: "McCovey",
  password: "recycler2",password_confirmation: "recycler2",radius: 5,
  address: "2841 Iolani St.", city: "Makawao", state: "HI", zipcode: "96768" },

  {username: "recycler3", email: "eldredspencer@gmail.com", phone: "8082803758",
  function: "recycler", first_name: "Juan", last_name: "Marchial",
  password: "recycler3",password_confirmation: "recycler3",radius: 5,
  address: "296 Liholani St.", city: "Makawao", state: "HI", zipcode: "96768" },

  {username: "recycler4", email: "eldredspencer@gmail.com", phone: "8082803758",
  function: "recycler", first_name: "Orlando", last_name: "Cepeda",
  password: "recycler4",password_confirmation: "recycler4", radius: 5,
  address: "2942 Aina Lani St.", city: "Makawao", state: "HI", zipcode: "96768" },

  {username: "recycler5", email: "eldredspencer@gmail.com", phone: "8082803758",
  function: "recycler", first_name: "Gaylord", last_name: "Perry",
  password: "recycler5",password_confirmation: "recycler5", radius: 5,
  address: "348 Nalani St.", city: "Makawao", state: "HI", zipcode: "96768" },

  {username: "recycler6", email: "eldredspencer@gmail.com", phone: "8082803758",
  function: "recycler", first_name: "Jack", last_name: "Clark",
  password: "recycler6",password_confirmation: "recycler6", radius: 5,
  address: "414 Brannan St.", city: "San Francisco", state: "CA", zipcode: "94107" },

  {username: "redeemer1", email: "eldredspencer@gmail.com", phone: "8082803758",
  function: "redeemer", first_name: "John", last_name: "Brodie",
  password: "redeemer1",password_confirmation: "redeemer1", radius: 5,
  address: "2741 Leolani Place", city: "Makawao", state: "HI", zipcode: "96768" },

  {username: "redeemer2", email: "eldredspencer@gmail.com", phone: "8082803758",
  function: "redeemer", first_name: "Ken", last_name: "Willard",
  password: "redeemer2",password_confirmation: "redeemer2", radius: 5,
  address: "2741 Leolani Place", city: "Makawao", state: "HI", zipcode: "96768" },

  {username: "redeemer3", email: "eldredspencer@gmail.com", phone: "8082803758",
  function: "redeemer", first_name: "Jerry", last_name: "Rice",
  password: "redeemer3",password_confirmation: "redeemer3", radius: 5,
  address: "268 St. Charles Ave", city: "San Francisco", state: "CA", zipcode: "94132" }

   ])

transactions = Transaction.create([
    {recycler_user_id: "1", plastic: "1", glass: "1", cans: "1", other: "1",
    address: "183 Pukulani St.", city: "Makawao", state: "HI", zipcode: "96768",
    selected: false, completed: false, trans_type: "redeemable" },

    {recycler_user_id: "2", plastic: "2", glass: "2", cans: "2", other: "2",
    address: "2841 Iolani St.", city: "Makawao", state: "HI", zipcode: "96768",
    selected: false, completed: false, trans_type: "redeemable" },

    {recycler_user_id: "3", plastic: "3", glass: "3", cans: "3", other: "3",
    address: "296 Liholani St.", city: "Makawao", state: "HI", zipcode: "96768",
    selected: false, completed: false, trans_type: "redeemable" },

    {recycler_user_id: "4", plastic: "4", glass: "4", cans: "4", other: "4",
    address: "2942 Aina Lani St.", city: "Makawao", state: "HI", zipcode: "96768",
    selected: false, completed: false, trans_type: "redeemable" },

    {recycler_user_id: "5", plastic: "5", glass: "5", cans: "5", other: "5",
    address: "348 Nalani St.", city: "Makawao", state: "HI", zipcode: "96768",
    selected: false, completed: false, trans_type: "redeemable" },

    {recycler_user_id: "6", plastic: "6", glass: "6", cans: "6", other: "6",
    address: "414 Brannan St.", city: "San Francisco", state: "CA", zipcode: "94107",
    selected: false, completed: false, trans_type: "redeemable" }

  ])



