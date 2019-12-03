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
      return nil
    end
  end

  def self.class_type(params)
    if params.to_s == "City"
    class_type = "cities"
    elsif params.to_s == "Country"
    class_type = "countries"
    else params.to_s == "Continent"
    class_type = "continents"
    end
    return class_type
  end

end
