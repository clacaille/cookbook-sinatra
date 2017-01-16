require 'open-uri'
require 'nokogiri'
require_relative 'recipe'

class Marmiton
  def search(keyword)
    list = []
    html_file = open("http://www.marmiton.org/recettes/recherche.aspx?aqt=#{keyword}")
    html_doc = Nokogiri::HTML(html_file, nil, 'utf-8')
    html_doc.search(".recette_classique").each do |recipe|
      name = recipe.search(".m_titre_resultat").text.strip
      description = recipe.search(".m_texte_resultat").text.strip
      cooking_time = recipe.search(".m_prep_time").first.parent.text.strip.to_i
      difficulty = recipe.search(".m_detail_recette").text.split("-")[2].strip.downcase
    list << Recipe.new({name: name, description: description, cooking_time: cooking_time, difficulty: difficulty})
    end
  return list
  end
end
