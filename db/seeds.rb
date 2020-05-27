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
    category:   '2',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590508379/No%20Mess/broccoli_dal6im.png'
  },
  {
    name:       "Banane",
    category:   '3',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590508506/No%20Mess/banana_ighpwd.png'
  },
  {
    name:       "Yaourt",
    category:   '4',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590508512/No%20Mess/yogurt_bnpfrp.png'
  },
  {
    name:       "Parmesan",
    category:   '7',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590569513/No%20Mess/grater_vsd481.png'
  },
  {
    name:       "Riz",
    category:   '8',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590567441/No%20Mess/rice_orz34s.png'
  },
  {
    name:       "Vin blanc",
    category:   '8',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590570805/No%20Mess/white-wine_ab9gtu.png'
  },
  {
    name:       "Tomate",
    category:   '2',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590570911/No%20Mess/tomato_kideom.png'
  },
  {
    name:       "Saumon",
    category:   '1',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590567717/No%20Mess/fish_cimslg.png'
  },
  {
    name:       "Pâtes",
    category:   '8',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590567884/No%20Mess/spaghetti_lygb7l.png'
  },
  {
    name:       "Huile d'olive",
    category:   '8',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590567947/No%20Mess/olive-oil_gqjpqp.png'
  },
  {
    name:       "Poivre",
    category:   '8',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590572409/No%20Mess/salt_bvwpix.png'
  },
   {
    name:       "Concombre",
    category:   '2',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590508083/No%20Mess/cucumber_ucgtun_o3ccx9.png'
  },
  # No image under
  {
    name:       "Carotte",
    category:   '5',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },
    {
    name:       "Melon",
    category:   '2',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },
    {
    name:       "Endive",
    category:   '2',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },
    {
    name:       "Salade",
    category:   '1',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },
    {
    name:       "Courgette",
    category:   '3',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },
    {
    name:       "Oignons",
    category:   '6',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },
    {
    name:       "Ail",
    category:   '6',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },
    {
    name:       "Oeuf",
    category:   '6',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },
    {
    name:       "Poireau",
    category:   '6',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },
    {
    name:       "Chou-fleur",
    category:   '2',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },
    {
    name:       "Pomme de terre",
    category:   '7',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },
    {
    name:       "Patate douce",
    category:   '7',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },
    {
    name:       "Ciboulette",
    category:   '1',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },
    {
    name:       "Persil",
    category:   '1',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
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
  ingredient.photo.attach(io: file, filename: "#{ingredient.name}.png", content_type: 'image/png')
  # if ingredient.photo.attached?
    ingredient.save!
  # else
  #   puts "Pas de photo"
  # end
end


veloute_brocolis = Recipe.create(name: "Velouté de brocolis", instructions: "1) Nettoyez les bouquets de brocolis, raccourcissez les trognons de 5 cm et retirez les feuilles.", difficulty_level: "Très facile", preparation_time: "15 min", cooking_time: "30 min", image:"https://res.cloudinary.com/dc1jk4jut/image/upload/v1590507892/no_mess/veloute_brocolis_mooxso.png")
tarte_saumon_brocolis = Recipe.create(name: "Tarte saumon brocolis", instructions: "Etaler la pâte dans un moule. Recouvrir des tranches de saumon. ", difficulty_level: "Très facile", preparation_time: "10 min", cooking_time: "30 min", image:"https://res.cloudinary.com/dc1jk4jut/image/upload/v1590507889/no_mess/tarte_brocolis_mdwa5m.png")
puree_brocolis = Recipe.create(name: "Purée de brocolis", instructions: "1) Préparez les brocolis, lavez-les et détachez-les en bouquets.", difficulty_level: "Facile", preparation_time: "20 min", cooking_time: "20 min", image:"https://res.cloudinary.com/dc1jk4jut/image/upload/v1590507892/no_mess/puree_brocolis_ieieby.png")


puts 'Finished!'

# Catégories
# 1. 3 jours
# 2. 5 jours
# 3. 1 semaine
# 4. 10 jours
# 5. 2 semaines
# 6. 3 semaines
# 7. 1 mois
# 8. Infini

  # {
  #   name:       "",
  #   category:   '',
  #   image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  # },
