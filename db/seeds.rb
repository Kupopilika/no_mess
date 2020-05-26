# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

Ingredient.destroy_all

puts "Start to add Ingredients in our seed"

ingredients = [
  {
    name:       "Brocoli",
    category:   'Fruits et légumes',
    image:      'https://res.cloudinary.com/dubgqyx31/image/upload/v1590415257/nomess/Brocoli_ywgssh.jpg'
  },
  {
    name:       "Banane",
    category:   'Fruits et légumes',
    image:      'https://res.cloudinary.com/dubgqyx31/image/upload/v1590416016/nomess/banane_DAC0XAQ_gpj5to.jpg'
  },
  {
    name:       "Yaourt",
    category:   'Produits laitiers',
    image:      'https://res.cloudinary.com/dubgqyx31/image/upload/v1590417815/nomess/yaourt_fkuzhq.jpg'
  },
  {
    name:       "Parmesan",
    category:   'Produits laitiers',
    image:      'https://res.cloudinary.com/dubgqyx31/image/upload/v1590417470/nomess/parmesan_bj155a.webp'
  },
  {
    name:       "Riz",
    category:   'Féculents',
    image:      'https://res.cloudinary.com/dubgqyx31/image/upload/v1590417749/nomess/riz_fisrkb.jpg'
  },
  {
    name:       "Vin blanc",
    category:   'Boissons',
    image:      'https://res.cloudinary.com/dubgqyx31/image/upload/v1590416386/nomess/sauternes-2016-liquoreux_onhvoe.jpg'
  },
  {
    name:       "Tomate",
    category:   'Fruits et légumes',
    image:      'https://res.cloudinary.com/dubgqyx31/image/upload/v1590416469/nomess/tomate_gfkr5j.jpg'
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
    image:      'https://res.cloudinary.com/dubgqyx31/image/upload/v1590416951/nomess/sticker-huile-d-olive_fqxh8w.jpg'
  },
  {
    name:       "Poivre",
    category:   'Condiments',
    image:      'https://res.cloudinary.com/dubgqyx31/image/upload/v1590417167/nomess/poivre_fkabwa.webp'
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


puts 'Finished!'
