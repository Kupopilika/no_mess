require "open-uri"
require "nokogiri"
require 'json'

# "a" à la place de "wb" pour le csv
urllist = []
urllist << "https://www.marmiton.org/recettes/recherche.aspx?type=all&aqt=p%C3%A2tes-brocolis%2C-parmesan"
urllist << "https://www.marmiton.org/recettes/recherche.aspx?type=all&aqt=tomate-saumon"
urllist << "https://www.marmiton.org/recettes/recherche.aspx?type=all&aqt=parmesan"

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
    
        preparation = html_doc.search('.recipe-infos__timmings__preparation').first.text.gsub(/(\t|\n)/, "")
        preparation = preparation.match( /\d+/ )
        
        tempcooking = html_doc.search('.recipe-infos__timmings__cooking').first
        if tempcooking
            cooking = tempcooking.text.gsub(/(\t|\n)/, "")
            cooking = cooking.match( /\d+/ )
        else
            cooking = nil
        end
    
        difficulty = html_doc.search('.recipe-infos__level span').first.text.strip
    
        html_doc.search('.recipe-preparation__list__item').each do |element|
            instructions << element.text.gsub(/(\t|\n)/, "")
        end
    
        html_doc.search('.recipe-ingredients__list__item div').each do |element|
            ingredients << element.text.gsub(/(\t|\n)/, "") 
        end
    
        image = html_doc.search('#af-diapo-desktop-0_img').first.attribute('src').value
    
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