# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

puts "Start to add Ingredients in our seed"

Ingredient.destroy_all

ingredients = [
  {
    name:       "Brocolis",
    category:   'Fruits et légumes',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590508379/No%20Mess/broccoli_dal6im.png'
  },
  {
    name:       "Banane",
    category:   'Fruits et légumes',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590508506/No%20Mess/banana_ighpwd.png'
  },
  {
    name:       "Yaourt",
    category:   'Produits laitiers',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590508512/No%20Mess/yogurt_bnpfrp.png'
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
    category:   'Viandes et poissons',
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
   {
    name:       "Concombre",
    category:   'Fruits et légumes',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590508083/No%20Mess/cucumber_ucgtun_o3ccx9.png'  },
]

# user = User.create(email:"mess@gmail.com", password:"A12345", first_name: "master", last_name:"chief", address:"nintendoland", phone_number:"0123456789", avatar:"http://www.pngall.com/wp-content/uploads/2/Video-Game-PNG-Pic.png")
# user.save!
# user2 = User.create(email:"messa@gmail.com", password:"A12345", first_name: "yoshi", last_name:"nintendo", address:"nintendoland", phone_number:"0123456788", avatar:"http://www.pngall.com/wp-content/uploads/2/Video-Game-PNG-Pic.png")
# user2.save!
# puts user


ingredients.each do |data|
  file = URI.open(data[:image])
  ingredient = Ingredient.new(name: data[:name], category: data[:category])
  ingredient.photo.attach(io: file, filename: "#{ingredient.name}.png", content_type: 'image/png')
  if ingredient.photo.attached?
    ingredient.save!
  else
    puts "Pas de photo"
  end
end


puts 'Finished!'
