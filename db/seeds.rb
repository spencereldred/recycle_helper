# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([
  {username: "makawao1", email: "eldredspencer@gmail.com", phone: "8082803758",
  function: "recycler", first_name: "Willie", last_name: "Mays",
  password: "makawao1",password_confirmation: "makawao1", radius: 8,
  address: "183 Pukulani St.", city: "Makawao", state: "HI", zipcode: "96768" },

   {username: "makawao2", email: "eldredspencer@gmail.com ", phone: "8082803758",
  function: "recycler", first_name: "Willie", last_name: "McCovey",
  password: "makawao2",password_confirmation: "makawao2",radius: 8,
  address: "2841 Iolani St.", city: "Makawao", state: "HI", zipcode: "96768" },

  {username: "makawao3", email: "eldredspencer@gmail.com", phone: "8082803758",
  function: "recycler", first_name: "Juan", last_name: "Marchial",
  password: "makawao3",password_confirmation: "makawao3",radius: 8,
  address: "296 Liholani St.", city: "Makawao", state: "HI", zipcode: "96768" },

  {username: "makawao4", email: "eldredspencer@gmail.com", phone: "8082803758",
  function: "recycler", first_name: "Orlando", last_name: "Cepeda",
  password: "makawao4",password_confirmation: "makawao4", radius: 8,
  address: "2942 Aina Lani St.", city: "Makawao", state: "HI", zipcode: "96768" },

  {username: "makawao5", email: "eldredspencer@gmail.com", phone: "8082803758",
  function: "recycler", first_name: "Gaylord", last_name: "Perry",
  password: "makawao5",password_confirmation: "makawao5", radius: 8,
  address: "348 Nalani St.", city: "Makawao", state: "HI", zipcode: "96768" },

  {username: "makawao6", email: "eldredspencer@gmail.com", phone: "8082803758",
  function: "redeemer", first_name: "John", last_name: "Brodie",
  password: "makawao6",password_confirmation: "makawao6", radius: 8,
  address: "2741 Leolani Place", city: "Makawao", state: "HI", zipcode: "96768" },

  {username: "makawao7", email: "eldredspencer@gmail.com", phone: "8082803758",
  function: "redeemer", first_name: "Ken", last_name: "Willard",
  password: "makawao7",password_confirmation: "makawao7", radius: 8,
  address: "2741 Leolani Place", city: "Makawao", state: "HI", zipcode: "96768" },

  {username: "kihei1", email: "eldredspencer@gmail.com", phone: "8082803758",
  function: "recycler", first_name: "Willie", last_name: "Mays",
  password: "kihei1",password_confirmation: "kihei1", radius: 8,
  address: "210 Kapili St.", city: "Kihei", state: "HI", zipcode: "96753" },

   {username: "kihei2", email: "eldredspencer@gmail.com ", phone: "8082803758",
  function: "recycler", first_name: "Willie", last_name: "McCovey",
  password: "kihei2",password_confirmation: "kihei2",radius: 8,
  address: "88 Akala Drive", city: "Kihei", state: "HI", zipcode: "96753" },

  {username: "kihei3", email: "eldredspencer@gmail.com", phone: "8082803758",
  function: "recycler", first_name: "Juan", last_name: "Marchial",
  password: "kihei3",password_confirmation: "kihei3",radius: 8,
  address: "35 Waakea Place.", city: "Kihei", state: "HI", zipcode: "96753" },

  {username: "kihei4", email: "eldredspencer@gmail.com", phone: "8082803758",
  function: "recycler", first_name: "Orlando", last_name: "Cepeda",
  password: "kihei4",password_confirmation: "kihei4", radius: 8,
  address: "101 Ahekolo Street", city: "Kihei", state: "HI", zipcode: "96753" },

  {username: "kihei5", email: "eldredspencer@gmail.com", phone: "8082803758",
  function: "recycler", first_name: "Gaylord", last_name: "Perry",
  password: "kihei5",password_confirmation: "kihei5", radius: 8,
  address: "50 Lioholo Place", city: "Kihei", state: "HI", zipcode: "96753" },

  {username: "kihei6", email: "eldredspencer@gmail.com", phone: "8082803758",
  function: "redeemer", first_name: "John", last_name: "Brodie",
  password: "kihei6",password_confirmation: "kihei6", radius: 8,
  address: "2100 Iliwai Loop", city: "Kihei", state: "HI", zipcode: "96753" },

  {username: "kihei7", email: "eldredspencer@gmail.com", phone: "8082803758",
  function: "redeemer", first_name: "Gene", last_name: "Washington",
  password: "kihei7",password_confirmation: "kihei7", radius: 8,
  address: "2100 Iliwai Loop", city: "Kihei", state: "HI", zipcode: "96753" },

  {username: "lahaina1", email: "eldredspencer@gmail.com", phone: "8082803758",
  function: "recycler", first_name: "Willie", last_name: "Mays",
  password: "lahaina1",password_confirmation: "lahaina1", radius: 8,
  address: "45 Kaakepa Street", city: "Lahaina", state: "HI", zipcode: "96761" },

   {username: "lahaina2", email: "eldredspencer@gmail.com ", phone: "8082803758",
  function: "recycler", first_name: "Willie", last_name: "McCovey",
  password: "lahaina2",password_confirmation: "lahaina2",radius: 8,
  address: "45 Lokia Street", city: "Lahaina", state: "HI", zipcode: "96761" },

  {username: "lahaina3", email: "eldredspencer@gmail.com", phone: "8082803758",
  function: "recycler", first_name: "Juan", last_name: "Marchial",
  password: "lahaina3",password_confirmation: "lahaina3",radius: 8,
  address: "150 Anapuni Loop", city: "Lahaina", state: "HI", zipcode: "96761" },

  {username: "lahaina4", email: "eldredspencer@gmail.com", phone: "8082803758",
  function: "recycler", first_name: "Orlando", last_name: "Cepeda",
  password: "lahaina4",password_confirmation: "lahaina4", radius: 8,
  address: "75 Kohi St", city: "Lahaina", state: "HI", zipcode: "96761" },

  {username: "lahaina5", email: "eldredspencer@gmail.com", phone: "8082803758",
  function: "recycler", first_name: "Gaylord", last_name: "Perry",
  password: "lahaina5",password_confirmation: "lahaina5", radius: 8,
  address: "65 Poinciana Rd", city: "Lahaina", state: "HI", zipcode: "96761" },

  {username: "lahaina6", email: "eldredspencer@gmail.com", phone: "8082803758",
  function: "redeemer", first_name: "John", last_name: "Brodie",
  password: "lahaina6",password_confirmation: "lahaina6", radius: 8,
  address: "100 Kelawea St", city: "Lahaina", state: "HI", zipcode: "96761" },

  {username: "lahaina7", email: "eldredspencer@gmail.com", phone: "8082803758",
  function: "redeemer", first_name: "Gene", last_name: "Washington",
  password: "lahaina7",password_confirmation: "lahaina7", radius: 8,
  address: "100 Kelawea St", city: "Lahaina", state: "HI", zipcode: "96761" },

  {username: "kahului1", email: "eldredspencer@gmail.com", phone: "8082803758",
  function: "recycler", first_name: "Willie", last_name: "Mays",
  password: "kahului1",password_confirmation: "kahului1", radius: 8,
  address: "34 Ani Street", city: "Kahului", state: "HI", zipcode: "96732" },

   {username: "kahului2", email: "eldredspencer@gmail.com ", phone: "8082803758",
  function: "recycler", first_name: "Willie", last_name: "McCovey",
  password: "kahului2",password_confirmation: "kahului2",radius: 8,
  address: "55 Molokai Akau Street", city: "Kahului", state: "HI", zipcode: "96732" },

  {username: "kahului3", email: "eldredspencer@gmail.com", phone: "8082803758",
  function: "recycler", first_name: "Juan", last_name: "Marchial",
  password: "kahului3",password_confirmation: "kahului3",radius: 8,
  address: "85 Niihau Street", city: "Kahului", state: "HI", zipcode: "96732" },

  {username: "kahului4", email: "eldredspencer@gmail.com", phone: "8082803758",
  function: "recycler", first_name: "Orlando", last_name: "Cepeda",
  password: "kahului4",password_confirmation: "kahului4", radius: 8,
  address: "85 Kaikai Street", city: "Wailuku", state: "HI", zipcode: "96793" },

  {username: "kahului5", email: "eldredspencer@gmail.com", phone: "8082803758",
  function: "recycler", first_name: "Gaylord", last_name: "Perry",
  password: "kahului5",password_confirmation: "kahului5", radius: 8,
  address: "55 Olena Street", city: "Wailuku", state: "HI", zipcode: "96793" },

  {username: "kahului6", email: "eldredspencer@gmail.com", phone: "8082803758",
  function: "redeemer", first_name: "John", last_name: "Brodie",
  password: "kahului6",password_confirmation: "kahului6", radius: 8,
  address: "85 Onehee Avenue", city: "Kahului", state: "HI", zipcode: "96732" },

  {username: "kahului7", email: "eldredspencer@gmail.com", phone: "8082803758",
  function: "redeemer", first_name: "Gene", last_name: "Washington",
  password: "kahului7",password_confirmation: "kahului7", radius: 8,
  address: "85 Onehee Avenue", city: "Kahului", state: "HI", zipcode: "96732" }

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

    {recycler_user_id: "6", plastic: "1", glass: "1", cans: "1", other: "1",
    address: "210 Kapili St.", city: "Kihei", state: "HI", zipcode: "96753",
    selected: false, completed: false, trans_type: "redeemable" },

    {recycler_user_id: "7", plastic: "2", glass: "2", cans: "2", other: "2",
    address: "88 Akala Drive", city: "Kihei", state: "HI", zipcode: "96753",
    selected: false, completed: false, trans_type: "redeemable" },

    {recycler_user_id: "8", plastic: "3", glass: "3", cans: "3", other: "3",
    address: "35 Waakea Place.", city: "Kihei", state: "HI", zipcode: "96753",
    selected: false, completed: false, trans_type: "redeemable" },

    {recycler_user_id: "9", plastic: "4", glass: "4", cans: "4", other: "4",
    address: "101 Ahekolo Street", city: "Kihei", state: "HI", zipcode: "96753",
    selected: false, completed: false, trans_type: "redeemable" },

    {recycler_user_id: "10", plastic: "5", glass: "5", cans: "5", other: "5",
    address: "50 Lioholo Place", city: "Kihei", state: "HI", zipcode: "96753",
    selected: false, completed: false, trans_type: "redeemable" },

    {recycler_user_id: "11", plastic: "1", glass: "1", cans: "1", other: "1",
    address: "45 Kaakepa Street", city: "Lahaina", state: "HI", zipcode: "96761",
    selected: false, completed: false, trans_type: "redeemable" },

    {recycler_user_id: "12", plastic: "2", glass: "2", cans: "2", other: "2",
    address: "45 Lokia Street", city: "Lahaina", state: "HI", zipcode: "96761",
    selected: false, completed: false, trans_type: "redeemable" },

    {recycler_user_id: "13", plastic: "3", glass: "3", cans: "3", other: "3",
    address: "150 Anapuni Loop", city: "Lahaina", state: "HI", zipcode: "96761",
    selected: false, completed: false, trans_type: "redeemable" },

    {recycler_user_id: "14", plastic: "4", glass: "4", cans: "4", other: "4",
    address: "75 Kohi St", city: "Lahaina", state: "HI", zipcode: "96761",
    selected: false, completed: false, trans_type: "redeemable" },

    {recycler_user_id: "15", plastic: "5", glass: "5", cans: "5", other: "5",
    address: "65 Poinciana Rd", city: "Lahaina", state: "HI", zipcode: "96761",
    selected: false, completed: false, trans_type: "redeemable" },

    {recycler_user_id: "16", plastic: "1", glass: "1", cans: "1", other: "1",
    address: "34 Ani Street", city: "Kahului", state: "HI", zipcode: "96732",
    selected: false, completed: false, trans_type: "redeemable" },

    {recycler_user_id: "17", plastic: "2", glass: "2", cans: "2", other: "2",
    address: "55 Molokai Akau Street", city: "Kahului", state: "HI", zipcode: "96732",
    selected: false, completed: false, trans_type: "redeemable" },

    {recycler_user_id: "18", plastic: "3", glass: "3", cans: "3", other: "3",
    address: "85 Niihau Street", city: "Kahului", state: "HI", zipcode: "96732",
    selected: false, completed: false, trans_type: "redeemable" },

    {recycler_user_id: "19", plastic: "4", glass: "4", cans: "4", other: "4",
    address: "85 Kaikai Street", city: "Wailuku", state: "HI", zipcode: "96793",
    selected: false, completed: false, trans_type: "redeemable" },

    {recycler_user_id: "20", plastic: "5", glass: "5", cans: "5", other: "5",
    address: "55 Olena Street", city: "Wailuku", state: "HI", zipcode: "96793",
    selected: false, completed: false, trans_type: "redeemable" }


  ])



