require "open-uri"
require "nokogiri"
require 'json'

# "a" à la place de "wb" pour le csv
urllist = [
    "https://www.marmiton.org/recettes/recherche.aspx?type=all&aqt=p%C3%A2tes-brocolis%2C-parmesan",
    "https://www.marmiton.org/recettes/recherche.aspx?type=all&aqt=tomate-saumon",
    "https://www.marmiton.org/recettes/recherche.aspx?type=all&aqt=parmesan",
    "https://www.marmiton.org/recettes/recherche.aspx?type=all&aqt=concombre",
    "https://www.marmiton.org/recettes/recherche.aspx?type=all&aqt=carotte",
    "https://www.marmiton.org/recettes/recherche.aspx?type=all&aqt=endive",
    "https://www.marmiton.org/recettes/recherche.aspx?type=all&aqt=salade",
    "https://www.marmiton.org/recettes/recherche.aspx?type=all&aqt=courgette",
    "https://www.marmiton.org/recettes/recherche.aspx?type=all&aqt=oeuf",
    "https://www.marmiton.org/recettes/recherche.aspx?type=all&aqt=chou-fleur",
    "https://www.marmiton.org/recettes/recherche.aspx?type=all&aqt=pomme-de-terre",
    "https://www.marmiton.org/recettes/recherche.aspx?type=all&aqt=artichaut",
    "https://www.marmiton.org/recettes/recherche.aspx?type=all&aqt=asperge",
    "https://www.marmiton.org/recettes/recherche.aspx?type=all&aqt=aubergine",
    "https://www.marmiton.org/recettes/recherche.aspx?type=all&aqt=betterave",
    "https://www.marmiton.org/recettes/recherche.aspx?type=all&aqt=c%C3%A8pe",
    "https://www.marmiton.org/recettes/recherche.aspx?type=all&aqt=potiron",
    "https://www.marmiton.org/recettes/recherche.aspx?type=all&aqt=potimarron",
    "https://www.marmiton.org/recettes/recherche.aspx?type=all&aqt=haricot-vert",
    "https://www.marmiton.org/recettes/recherche.aspx?type=all&aqt=%C3%A9pinard",
    "https://www.marmiton.org/recettes/recherche.aspx?type=all&aqt=riz",
    "https://www.marmiton.org/recettes/recherche.aspx?type=all&aqt=petit-pois",
    "https://www.marmiton.org/recettes/recherche.aspx?type=all&aqt=avocat"
]

recipes = []

urllist.each do |url|
    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)
    
    urlall = []
    html_doc.search('.recipe-card-link').each do |element|
        tempurl = element.attribute('href').value
        if tempurl.include?("https://www.marmiton.org")
            urlresult = tempurl
        else
            urlmodif = "https://www.marmiton.org#{tempurl}"
            urlresult = urlmodif
        end
        urlall << urlresult
    end
    
    urlall.each do |urlspec|
        html_file = open(urlspec).read
        html_doc = Nokogiri::HTML(html_file)
    
        instructions = []
        ingredients = []
    
        name = html_doc.search('.main-title').first.text.strip
    
        temppreparation = html_doc.search('.recipe-infos__timmings__preparation').first
        if temppreparation
            preparation = temppreparation.text.gsub(/(\t|\n)/, "")
            preparation = preparation.match( /\d+/ )
        else
            preparation = nil
        end
        
        tempcooking = html_doc.search('.recipe-infos__timmings__cooking').first
        if tempcooking
            cooking = tempcooking.text.gsub(/(\t|\n)/, "")
            cooking = cooking.match( /\d+/ )
        else
            cooking = nil
        end
        
        tempdifficulty = html_doc.search('.recipe-infos__level span').first
        if tempdifficulty
            difficulty = tempdifficulty.text.strip
        else
            difficulty = nil
        end
    
        html_doc.search('.recipe-preparation__list__item').each do |element|
            instructions << element.text.gsub(/(\t|\n)/, "")
        end
    
        html_doc.search('.recipe-ingredients__list__item div').each do |element|
            ingredients << element.text.gsub(/(\t|\n)/, "") 
        end
    
        tempimage = html_doc.search('#af-diapo-desktop-0_img').first
        if tempimage
            image = tempimage.attribute('src').value
        else
            image = nil
        end
    
        puts name
        puts preparation
        puts cooking
        puts difficulty
        puts instructions
        puts ingredients
        puts image
    
    
        recipes << {
            name: name,
            preparation_time: preparation,
            cooking_time: cooking,
            difficulty: difficulty,
            instructions: instructions,
            ingredients: ingredients,
            image: image
        }
    
    end
end


File.open("scrapresult.json", 'a') do |file|
  file.write(JSON.generate({recipes: recipes}))
end

#AclemCUeOpT/Dx8+gjAdWhARENDRBdFqS2E0mCYtvl3uUtlR2nw57v9V/TroRU0uKmqcF0VUoDTyaJCehjhdWKd1ZdHkbsM+DFVF6Mlt46UgJUAwiS2JwUAMEG2ow30WbxEcdYYuap9uEuhKwOc3nXDyUv/aL+Ixlp0wGVvqjH3uyRyuXprBVjXL+GVxy/3bBgfxLFiwWGfruT/ofANJIfU31Y65qKABcxKkjVbNkmiVtLOiI+VWTSMce4CXqeuRx5w7Bei8m4VHVCk/CvZqgIhK/t56yGibbWiaQr7+Q2+dV57hKVlwfHM59tbk3jEQ16yu5tBbL0cg1DiX8p64LsE2BdTHUoO7dFEk6wh9XXlXHiRQBUJLQmakBgx8/MiYVBzPs6oAwlEDM0WwcaHGM+SA2sctmwLupLX/uOWUs3ZpI/IZ46p4kwacIsuKPTELb/l/nU7DJw/WBP5nsOh3Q+jSEmBsYP6l1G5upWRDC9gkI0kCXB0UAgrD8KvoE2WeI7lsOkW0zffsruLBkA0CNRAsOa12wJPzM+6gzSSFWu7sZh66QZPomTbwsVqUGy90TkFafC0oYOTcFZZ/ZkuPAo6Zgp8SPDffWO/raoq5DhoRrc3Ezw8aofjM+f3up5ce2S3SfQuaul7ge/j+VrSJZa6zq6MvfmEm0AD1wn99K1xLZFnUrojdkYl7wtkCVZMU1wFRDxxpwoFLveFcIMfcysHEs9+yUvVl3/37G+/WLQEGoNsHTb83GVG5ePdqrihwQCapwOYR+YYEIK/6ITm38HmzLhBeVc0MOW5T