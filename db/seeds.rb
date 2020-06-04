# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"
require "json"

puts "Start to add Ingredients in our seed"

Favorite.destroy_all
Ingredient.destroy_all
Recipe.destroy_all


ingredients = [
  {
    name:       "Brocoli",
    category:   '2',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590508379/No%20Mess/broccoli_dal6im.png'
  },
  {
    name:       "Banane",
    category:   '3',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590508506/No%20Mess/banana_ighpwd.png'
  },
  {
    name:       "Yaourt",
    category:   '4',
    unit:       'u',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590508512/No%20Mess/yogurt_bnpfrp.png'
  },
  {
    name:       "Parmesan",
    category:   '7',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590569513/No%20Mess/grater_vsd481.png'
  },
  {
    name:       "Riz",
    category:   '8',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590567441/No%20Mess/rice_orz34s.png'
  },
  {
    name:       "Vin blanc",
    category:   '8',
    unit:       'cl',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590570805/No%20Mess/white-wine_ab9gtu.png'
  },
  {
    name:       "Tomate",
    category:   '2',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590570911/No%20Mess/tomato_kideom.png'
  },
  {
    name:       "Saumon",
    category:   '1',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590567717/No%20Mess/fish_cimslg.png'
  },
  {
    name:       "Pâtes",
    category:   '8',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590567884/No%20Mess/spaghetti_lygb7l.png'
  },
  {
    name:       "Huile olive",
    category:   '8',
    unit:       'cl',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590567947/No%20Mess/olive-oil_gqjpqp.png'
  },
  {
    name:       "Poivre",
    category:   '8',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590572409/No%20Mess/salt_bvwpix.png'
  },
   {
    name:       "Concombre",
    category:   '2',
    unit:       'u',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590508083/No%20Mess/cucumber_ucgtun_o3ccx9.png'
  },
  {
    name:       "Carotte",
    category:   '5',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590588555/No%20Mess/carrot_p21kbg.png'
  },
    {
    name:       "Melon",
    category:   '2',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590588840/No%20Mess/melon_rrrh6n.png'
  },
    {
    name:       "Endive",
    category:   '2',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590588982/No%20Mess/endive_zqf9sv.png'
  },
    {
    name:       "Salade",
    category:   '1',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590589058/No%20Mess/lettuce_iahhor.png'
  },
    {
    name:       "Courgette",
    category:   '3',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590589183/No%20Mess/zucchini_yg4otu.png'
  },
    {
    name:       "Oignon",
    category:   '6',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590589448/No%20Mess/onion_qjgfzy.png'
  },
    {
    name:       "Ail",
    category:   '6',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590589738/No%20Mess/garlic_vv0kld.png'
  },
    {
    name:       "Oeuf",
    category:   '6',
    unit:       'u',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590589791/No%20Mess/eggs_pspyoe.png'
  },
    {
    name:       "Poireau",
    category:   '6',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590589856/No%20Mess/leek_f5foyp.png'
  },
    {
    name:       "Chou-fleur",
    category:   '2',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590590074/No%20Mess/cauliflower_qwjutp.png'
  },
    {
    name:       "Pomme de terre",
    category:   '7',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590590633/No%20Mess/potatoes_q4v3dp.png'
  },
    {
    name:       "Patate douce",
    category:   '7',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590591073/No%20Mess/potato_srckc5.png'
  },
    {
    name:       "Ciboulette",
    category:   '1',
    unit:       'u',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590591146/No%20Mess/chives_tl67p4.png'
  },
    {
    name:       "Persil",
    category:   '1',
    unit:       'u',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590591267/No%20Mess/parsley_tthu3x.png'
  },
    {
    name:       "Pomme",
    category:   '6',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590591322/No%20Mess/apple_fnytpi.png'
  },
    {
    name:       "Orange",
    category:   '5',
    unit:       'u',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590591384/No%20Mess/orange_ekj95g.png'
  },
    {
    name:       "Clémentine",
    category:   '5',
    unit:       'u',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590591384/No%20Mess/orange_ekj95g.png'
  },
    {
    name:       "Pêche",
    category:   '3',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590591520/No%20Mess/peach-2_bdlbwf.png'
  },
    {
    name:       "Poire",
    category:   '4',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590591615/No%20Mess/pear_duotkp.png'
  },
    {
    name:       "Raisin",
    category:   '3',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590591957/No%20Mess/grapes_jvuujr.png'
  },
    {
    name:       "Pamplemousse",
    category:   '4',
    unit:       'u',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590592306/No%20Mess/diet_gz4nte.png'
  },
    {
    name:       "Kiwi",
    category:   '4',
    unit:       'u',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590592362/No%20Mess/kiwi_u0foyf.png'
  },
    {
    name:       "Fraise",
    category:   '2',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590592402/No%20Mess/strawberry_fltwyd.png'
  },
    {
    name:       "Artichaut",
    category:   '1',
    unit:       'u',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590592504/No%20Mess/artichoke_ez9m5s.png'
  },
    {
    name:       "Asperge",
    category:   '2',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590592580/No%20Mess/asparagus_wfxau0.png'
  },
  {
    name:       "Aubergine",
    category:   '2',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590592610/No%20Mess/eggplant_l1kmnm.png'
  },
    {
    name:       "Betterave",
    category:   '2',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590592781/No%20Mess/beetroot_jiobae.png'
  },
    {
    name:       "Blette",
    category:   '1',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590594318/No%20Mess/chard_bv0hvh.png'
  },
    {
    name:       "Celeri Branche",
    category:   '2',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590594688/No%20Mess/celery_fljynw.png'
  },
    {
    name:       "Cèpe",
    category:   '1',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590594884/No%20Mess/mushroom_cgfyxo.png'
  },
    {
    name:       "Champignon",
    category:   '1',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590594996/No%20Mess/mushroom-2_uraqrn.png'
  },
    {
    name:       "Chou Kale",
    category:   '3',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590595044/No%20Mess/kale_wt0qhw.png'
  },
  {
    name:       "Chou de Bruxelles",
    category:   '3',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590595092/No%20Mess/brussels-sprouts_ryknsp.png'
  },
  {
    name:       "Courge Butternut",
    category:   '7',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590595160/No%20Mess/butternut_rqudh3.png'
  },
  {
    name:       "Potiron",
    category:   '7',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590595241/No%20Mess/pumpkin_wwh93x.png'
  },
  {
    name:       "Potimarron",
    category:   '7',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590595241/No%20Mess/pumpkin_wwh93x.png'
  },
    {
    name:       "Echalote",
    category:   '5',
    unit:       'u',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590595373/No%20Mess/shallot_xhugi3.png'
  },
    {
    name:       "Épinard",
    category:   '2',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590595422/No%20Mess/spinach_wkk7ku.png'
  },
    {
    name:       "Fenouil",
    category:   '2',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590595917/No%20Mess/fennel_li7yfq.png'
  },
    {
    name:       "Pousse de haricot mungo",
    category:   '1',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590678405/No%20Mess/haricotmungo_wgrkam.png'
  },
  {
    name:       "Fève",
    category:   '1',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590678565/No%20Mess/kisspng-computer-icons-bean-vegetarian-cuisine-clip-art-beans-vector-5adbeac24d3c30.0207747415243619223164_otvqbm.png'
  },
  {
    name:       "Haricots verts",
    category:   '1',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590678730/No%20Mess/haricotsverts_h77kc0.png'
  },
    {
    name:       "Navet",
    category:   '3',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590678814/No%20Mess/turnip_vaqg1u.png'
  },
    {
    name:       "Panais",
    category:   '3',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590678992/No%20Mess/carrot_rhft07.png'
  },
    {
    name:       "Petit pois",
    category:   '1',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590679094/No%20Mess/peas_ixmvmc.png'
  },
    {
    name:       "Poivron",
    category:   '3',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590679168/No%20Mess/bell-pepper_jmyntj.png'
  },
    {
    name:       "Radis",
    category:   '1',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590679246/No%20Mess/radish_vhsfze.png'
  },
    {
    name:       "Abricot",
    category:   '2',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590679314/No%20Mess/apricot_o3bx9q.png'
  },
    {
    name:       "Ananas",
    category:   '2',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590679483/No%20Mess/pineapple_fnyun8.png'
  },
    {
    name:       "Avocat",
    category:   '2',
    unit:       'u',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590679639/No%20Mess/avocado_uva1ur.png'
  },
    {
    name:       "Cerise",
    category:   '1',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590679776/No%20Mess/cherry_mojgm1.png'
  },
    {
    name:       "Citron",
    category:   '4',
    unit:       'u',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590679912/No%20Mess/lemon_i1k6my.png'
  },
    {
    name:       "Datte",
    category:   '7',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590680092/No%20Mess/date_wpwvft.png'
  },
    {
    name:       "Figue",
    category:   '1',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590680161/No%20Mess/fig_nvxfss.png'
  },
    {
    name:       "Framboise",
    category:   '1',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590680218/No%20Mess/raspberries_gkshjv.png'
  },
    {
    name:       "Kaki",
    category:   '3',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590680325/No%20Mess/persimmon_oxapsa.png'
  },
    {
    name:       "Goyave",
    category:   '2',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590680401/No%20Mess/guava_gp84gi.png'
  },
    {
    name:       "Mangue",
    category:   '2',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590680491/No%20Mess/mango_drolqj.png'
  },
    {
    name:       "Litchi",
    category:   '4',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590680649/No%20Mess/lychee_fmtnjk.png'
  },
    {
    name:       "Mirabelle",
    category:   '2',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590680857/No%20Mess/plum-2_mf6rws.png'
  },
    {
    name:       "Mûre",
    category:   '1',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590680927/No%20Mess/blackberry_i9ovxp.png'
  },
    {
    name:       "Myrtille",
    category:   '3',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590681017/No%20Mess/blueberry_wd5cmm.png'
  },
    {
    name:       "Papaye",
    category:   '1',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590681071/No%20Mess/papaya_sr4usk.png'
  },
    {
    name:       "Pastèque",
    category:   '3',
    unit:       'u',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590681140/No%20Mess/watermelon_ikbzij.png'
  },
    {
    name:       "Nectarine",
    category:   '1',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590591520/No%20Mess/peach_xxhxzb.png'
  },
    {
    name:       "Prune",
    category:   '2',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590680857/No%20Mess/plum_zvacyg.png'
  },
    {
    name:       "Rhubarbe",
    category:   '1',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590681700/No%20Mess/Rhubarbe_egycbz.png'
  },
     {
    name:       "Viande rouge",
    category:   '2',
    unit:       'g',
    image:      'https://res.cloudinary.com/dubgqyx31/image/upload/v1591105757/meat_dtndtr.png'
  },
    {
    name:       "Poulet",
    category:   '1',
    unit:       'g',
    image:      'https://res.cloudinary.com/dubgqyx31/image/upload/v1591107093/chicken_ympcbo.png'
  },
   {
    name:       "Fromage",
    category:   '7',
    unit:       'g',
    image:      'https://res.cloudinary.com/dubgqyx31/image/upload/v1591100857/cheese_ackrkl.png'
  },
   {
    name:       "Charcuterie",
    category:   '2',
    unit:       'g',
    image:      'https://res.cloudinary.com/dubgqyx31/image/upload/v1591109012/sausage_vcv2hj.png'
  },
   {
    name:       "Poisson",
    category:   '1',
    unit:       'g',
    image:      'https://res.cloudinary.com/dubgqyx31/image/upload/v1591109754/dolly-fish_tcmxaa.png'
  },
   {
    name:       "Salami",
    category:   '2',
    unit:       'g',
    image:      'https://res.cloudinary.com/dubgqyx31/image/upload/v1591109012/sausage_vcv2hj.png'
  },
   {
    name:       "Fêta",
    category:   '7',
    unit:       'g',
    image:      'https://res.cloudinary.com/dubgqyx31/image/upload/v1591100857/cheese_ackrkl.png'
  },
  {
    name:       "Sel",
    category:   '8',
    unit:       'g',
    image:      'https://res.cloudinary.com/kupopilika/image/upload/v1590572409/No%20Mess/salt_bvwpix.png'
  },
  {
    name:       "Sauce Soja",
    category:   '8',
    unit:       'cl',
    image:      'https://res.cloudinary.com/dubgqyx31/image/upload/v1591108798/soy_vkxqor.png'
  },
    {
    name:       "Beurre",
    category:   '2',
    unit:       'g',
    image:      'https://res.cloudinary.com/dubgqyx31/image/upload/v1591108650/butter_ufgmte.png'
  },
    {
    name:       "Farine",
    category:   '8',
    unit:       'g',
    image:      'https://res.cloudinary.com/dubgqyx31/image/upload/v1591110071/flour_lp9wmz.png'
  },
  # {
  #   name:       "Lait",
  #   category:   '7',
  #   unit:       'cl',
  #   image:      'https://res.cloudinary.com/dubgqyx31/image/upload/v1591122586/milk.png'
  # },
  {
    name:       "Basilic",
    category:   '8',
    unit:       'u',
    image:      'https://res.cloudinary.com/dubgqyx31/image/upload/v1591112836/basil_2_ttzzxy.png'
  },
  {
    name:       "Menthe",
    category:   '8',
    unit:       'u',
    image:      'https://res.cloudinary.com/dubgqyx31/image/upload/v1591113318/mint_obljvw.png'
  },
  {
    name:       "Tagliatelle",
    category:   '8',
    unit:       'u',
    image:      'https://res.cloudinary.com/dubgqyx31/image/upload/v1591113463/pasta_1_q7xev0.png'
  },
  # {
  #   name:       "Bouillon",
  #   category:   '8',
  #   unit:       'u',
  #   image:      'https://res.cloudinary.com/dubgqyx31/image/upload/v1591122635/bouillon.png'
  # },
  {
    name:       "Burger",
    category:   '2',
    unit:       'u',
    image:      'https://res.cloudinary.com/dubgqyx31/image/upload/v1591113824/burger_1_sd4rch.png'
  },
  {
    name:       "Crème",
    category:   '2',
    unit:       'g',
    image:      'https://res.cloudinary.com/dubgqyx31/image/upload/v1591122150/skin_fgacgc.png'
  },
]

# user = User.create(email:"mess@gmail.com", password:"A12345", first_name: "master", last_name:"chief", address:"nintendoland", phone_number:"0123456789", avatar:"http://www.pngall.com/wp-content/uploads/2/Video-Game-PNG-Pic.png")
# user.save!
# user2 = User.create(email:"messa@gmail.com", password:"A12345", first_name: "yoshi", last_name:"nintendo", address:"nintendoland", phone_number:"0123456788", avatar:"http://www.pngall.com/wp-content/uploads/2/Video-Game-PNG-Pic.png")
# user2.save!
# puts user


ingredients.each do |data|
  file = URI.open(data[:image])
  ingredient = Ingredient.new(name: data[:name], category: data[:category], unit: data[:unit])
  ingredient.photo.attach(io: file, filename: "#{ingredient.name}.png", content_type: 'image/png')
  # if ingredient.photo.attached?
    ingredient.save!
  # else
  #   puts "Pas de photo"
  # end
end

# recipe = Recipe.new(name: "Risotto aux brocolis", instructions: "Faire chauffer...", difficulty_level: "Très facile", preparation_time: "10 min", cooking_time: "20 min", image: "https://res.cloudinary.com/dubgqyx31/image/upload/v1590489505/nomess/poivre_fkabwa_c07q58.png")
# recipe.save!
filepath = 'scrapresult.json'
serialized_recipes = File.read(filepath)

recipes = JSON.parse(serialized_recipes)


i = 0
while i <= recipes["recipes"].length - 1
  recipe = Recipe.create(name: recipes["recipes"][i]["name"], preparation_time: recipes["recipes"][i]["preparation_time"], cooking_time: recipes["recipes"][i]["cooking_time"], difficulty_level: recipes["recipes"][i]["difficulty"], instructions: recipes["recipes"][i]["instructions"], ingredient_list: recipes["recipes"][i]["ingredients"], image: recipes["recipes"][i]["image"])
  recipes["recipes"][i]["ingredients"].each do |scraped_ingredient|
    ingredient = Ingredient.all.find { |ingredient| scraped_ingredient.include?(ingredient.name.downcase) }
    quantity = scraped_ingredient.match(/\d+/).to_s.to_i
    RecipeIngredient.create(ingredient: ingredient, recipe: recipe, quantity: quantity)
  end
  # puts recipes["recipes"][i]["name"]
  # puts recipes["recipes"][i]["preparation_time"]
  # puts recipes["recipes"][i]["cooking_time"]
  # puts recipes["recipes"][i]["difficulty"]
  # puts recipes["recipes"][i]["instructions"]
  # puts recipes["recipes"][i]["ingredients"]
  # puts recipes["recipes"][i]["image"]
  i += 1
end

# veloute_brocolis = Recipe.create(name: "Velouté de brocolis", instructions: "1) Nettoyez les bouquets de brocolis, raccourcissez les trognons de 5 cm et retirez les feuilles.", difficulty_level: "Très facile", preparation_time: "15 min", cooking_time: "30 min", image:"https://res.cloudinary.com/dc1jk4jut/image/upload/v1590507892/no_mess/veloute_brocolis_mooxso.png")
# tarte_saumon_brocolis = Recipe.create(name: "Tarte saumon brocolis", instructions: "Etaler la pâte dans un moule. Recouvrir des tranches de saumon. ", difficulty_level: "Très facile", preparation_time: "10 min", cooking_time: "30 min", image:"https://res.cloudinary.com/dc1jk4jut/image/upload/v1590507889/no_mess/tarte_brocolis_mdwa5m.png")
# puree_brocolis = Recipe.create(name: "Purée de brocolis", instructions: "1) Préparez les brocolis, lavez-les et détachez-les en bouquets.", difficulty_level: "Facile", preparation_time: "20 min", cooking_time: "20 min", image:"https://res.cloudinary.com/dc1jk4jut/image/upload/v1590507892/no_mess/puree_brocolis_ieieby.png")

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
