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
  {
    name:       "Carotte",
    category:   '5',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590588555/No%20Mess/carrot_p21kbg.png'
  },
    {
    name:       "Melon",
    category:   '2',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590588840/No%20Mess/melon_rrrh6n.png'
  },
    {
    name:       "Endive",
    category:   '2',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590588982/No%20Mess/endive_zqf9sv.png'
  },
    {
    name:       "Salade",
    category:   '1',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590589058/No%20Mess/lettuce_iahhor.png'
  },
    {
    name:       "Courgette",
    category:   '3',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590589183/No%20Mess/zucchini_yg4otu.png'
  },
    {
    name:       "Oignons",
    category:   '6',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590589448/No%20Mess/onion_qjgfzy.png'
  },
    {
    name:       "Ail",
    category:   '6',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590589738/No%20Mess/garlic_vv0kld.png'
  },
    {
    name:       "Oeuf",
    category:   '6',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590589791/No%20Mess/eggs_pspyoe.png'
  },
    {
    name:       "Poireau",
    category:   '6',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590589856/No%20Mess/leek_f5foyp.png'
  },
    {
    name:       "Chou-fleur",
    category:   '2',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590590074/No%20Mess/cauliflower_qwjutp.png'
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
    {
    name:       "Pomme",
    category:   '6',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },
    {
    name:       "Orange",
    category:   '5',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },
    {
    name:       "Clémentine",
    category:   '5',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },
    {
    name:       "Pêche",
    category:   '3',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },
    {
    name:       "Poire",
    category:   '4',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },
    {
    name:       "Raisin",
    category:   '3',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },
    {
    name:       "Pamplemousse",
    category:   '4',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },
    {
    name:       "Kiwi",
    category:   '4',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },
    {
    name:       "Fraise",
    category:   '2',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },
    {
    name:       "Artichaut",
    category:   '1',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },
    {
    name:       "Asperge",
    category:   '2',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },
  {
    name:       "Aubergine",
    category:   '2',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },
    {
    name:       "Betterave",
    category:   '2',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },
    {
    name:       "Blette",
    category:   '1',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },
    {
    name:       "Celeri Branche",
    category:   '2',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },
    {
    name:       "Cèpe",
    category:   '1',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },
    {
    name:       "Champignon de Paris",
    category:   '1',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },
    {
    name:       "Chou Kale",
    category:   '3',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },  {
    name:       "Chou de Bruxelles",
    category:   '3',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },  {
    name:       "Courge Butternut",
    category:   '7',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },  {
    name:       "Potiron",
    category:   '7',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },  {
    name:       "Potimarron",
    category:   '7',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },
    {
    name:       "Echalote",
    category:   '5',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },  {
    name:       "Epinard",
    category:   '2',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },  {
    name:       "Fenouil",
    category:   '2',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },  {
    name:       "Pousse de haricot mungo",
    category:   '1',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },  {
    name:       "Fève",
    category:   '1',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },  {
    name:       "Haricots verts",
    category:   '1',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },
    {
    name:       "Navet",
    category:   '3',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },
    {
    name:       "Panais",
    category:   '3',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },
    {
    name:       "Petit pois",
    category:   '1',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },
    {
    name:       "Poivron",
    category:   '3',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },
    {
    name:       "Radis",
    category:   '1',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },
    {
    name:       "Abricot",
    category:   '2',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },
    {
    name:       "Ananas",
    category:   '2',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },
    {
    name:       "Avocat",
    category:   '2',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },
    {
    name:       "Cerise",
    category:   '1',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },
    {
    name:       "Citron",
    category:   '4',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },
    {
    name:       "Datte",
    category:   '7',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },
    {
    name:       "Figue",
    category:   '1',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },
    {
    name:       "Framboise",
    category:   '1',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },
    {
    name:       "Kaki",
    category:   '3',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },
    {
    name:       "Goyave",
    category:   '2',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },
    {
    name:       "Mangue",
    category:   '2',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },
    {
    name:       "Litchi",
    category:   '4',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },
    {
    name:       "Mirabelle",
    category:   '2',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },
    {
    name:       "Mûre",
    category:   '1',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },
    {
    name:       "Myrtille",
    category:   '3',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },
    {
    name:       "Papaye",
    category:   '1',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },
    {
    name:       "Pastèque",
    category:   '3',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },
    {
    name:       "Nectarine",
    category:   '1',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },
    {
    name:       "Prune",
    category:   '2',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590574543/No%20Mess/harvest_jlu7ek.png'
  },
    {
    name:       "Rhubarbe",
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
