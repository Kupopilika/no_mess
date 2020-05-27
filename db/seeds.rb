# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

puts "Start to add Ingredients in our seed"

ingredients = [
  {
    name:       "Brocoli",
    category:   'Fruits et légumes',
    image:      'https://res.cloudinary.com/dubgqyx31/image/upload/v1590490322/nomess/Brocoli_ywgssh_tmkr1w.png'
  },
  {
    name:       "Banane",
    category:   'Fruits et légumes',
    image:      'https://res.cloudinary.com/dubgqyx31/image/upload/v1590490222/nomess/banane_DAC0XAQ_gpj5to_yhisjf.png'
  },
  {
    name:       "Yaourt",
    category:   'Produits laitiers',
    image:      'https://res.cloudinary.com/dubgqyx31/image/upload/v1590490128/nomess/yaourt_fkuzhq_pdruhw.png'
  },
  {
    name:       "Parmesan",
    category:   'Produits laitiers',
    image:      'https://res.cloudinary.com/dubgqyx31/image/upload/v1590490062/nomess/parmesan_bj155a_sf5gzl.png'
  },
  {
    name:       "Riz",
    category:   'Féculents',
    image:      'https://res.cloudinary.com/dubgqyx31/image/upload/v1590489968/nomess/riz_fisrkb_ev9c1q.png'
  },
  {
    name:       "Vin blanc",
    category:   'Boissons',
    image:      'https://res.cloudinary.com/dubgqyx31/image/upload/v1590489799/nomess/sauternes-2016-liquoreux_onhvoe_kio3o5.png'
  },
  {
    name:       "Tomate",
    category:   'Fruits et légumes',
    image:      'https://res.cloudinary.com/dubgqyx31/image/upload/v1590489697/nomess/tomate_gfkr5j_dflgba.png'
  },
  {
    name:       "Saumon",
    category:   'Protéines',
    image:      'https://res.cloudinary.com/dubgqyx31/image/upload/v1590417300/nomess/saumon_unhydx.png'
  },
  {
    name:       "Pâtes",
    category:   'Féculents',
    image:      'https://res.cloudinary.com/dubgqyx31/image/upload/v1590417589/nomess/pates_hzcsf2.png'
  },
  {
    name:       "Huile d'olive",
    category:   'Condiments',
    image:      'https://res.cloudinary.com/dubgqyx31/image/upload/v1590489610/nomess/sticker-huile-d-olive_fqxh8w_tjl0qe.png'
  },
  {
    name:       "Poivre",
    category:   'Condiments',
    image:      'https://res.cloudinary.com/dubgqyx31/image/upload/v1590489505/nomess/poivre_fkabwa_c07q58.png'
  },
]

# user = User.create(email:"mess@gmail.com", password:"A12345", first_name: "master", last_name:"chief", address:"nintendoland", phone_number:"0123456789", avatar:"http://www.pngall.com/wp-content/uploads/2/Video-Game-PNG-Pic.png")
# user.save!
# user2 = User.create(email:"messa@gmail.com", password:"A12345", first_name: "yoshi", last_name:"nintendo", address:"nintendoland", phone_number:"0123456788", avatar:"http://www.pngall.com/wp-content/uploads/2/Video-Game-PNG-Pic.png")
# user2.save!
# puts user


ingredients.each do |data|
  file = URI.open(data[:image])
  ingredient = Ingredient.new(name: data[:name], category: data[:category])
  ingredient.photo.attach(io: file, filename: 'ingredient.png', content_type: 'image/png')
  ingredient.save!
end

veloute_brocolis = Recipe.create(name: "Velouté de brocolis", instructions: "1) Nettoyez les bouquets de brocolis, raccourcissez les trognons de 5 cm et retirez les feuilles.", difficulty_level: "Très facile", preparation_time: "15 min", cooking_time: "30 min", image:"https://res.cloudinary.com/dc1jk4jut/image/upload/v1590507892/no_mess/veloute_brocolis_mooxso.png")
tarte_saumon_brocolis = Recipe.create(name: "Tarte saumon brocolis", instructions: "Etaler la pâte dans un moule. Recouvrir des tranches de saumon. ", difficulty_level: "Très facile", preparation_time: "10 min", cooking_time: "30 min", image:"https://res.cloudinary.com/dc1jk4jut/image/upload/v1590507889/no_mess/tarte_brocolis_mdwa5m.png")
puree_brocolis = Recipe.create(name: "Purée de brocolis", instructions: "1) Préparez les brocolis, lavez-les et détachez-les en bouquets.", difficulty_level: "Facile", preparation_time: "20 min", cooking_time: "20 min", image:”https://res.cloudinary.com/dc1jk4jut/image/upload/v1590507892/no_mess/puree_brocolis_ieieby.png")

puts 'Finished!'
