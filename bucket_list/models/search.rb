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




end
