require_relative('../db/sql_runner')
require_relative('continent')
require_relative('country')
require_relative('city')

class Search

  def self.search(searched_word)
    if City.search(searched_word) != nil
      return City.search(searched_word)
    elsif Country.search(searched_word) != nil
      return Country.search(searched_word)
    elsif Continent.search(searched_word) != nil
      return Continent.search(searched_word)
    else
      return "That city has not been found in
      the database, please try agian."
    end
  end

  # def self.class_type(params)
  #   if params == "City"
  #   class_type = "cities"
  #   elsif params == "Country"
  #   class_type = "countries"
  #   else params == "Continent"
  #   class_type = "continents"
  #   end
  #   return class_type
  # end

end
