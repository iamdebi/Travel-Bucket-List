require_relative('../db/sql_runner')
require_relative('country')

class Continent

  attr_reader :id
  attr_accessor :name, :img

  def initialize(details)
    @id = details['id'].to_i() if details['id']
    @name = details['name']
    @img = details['img']
  end

  def save()
    sql = "INSERT INTO continents (name, img)
     VALUES ($1, $2) RETURNING id"
    values = [@name, @img]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i()
  end

  def self.delete_all()
    sql = "DELETE FROM continents"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE continents SET
    name = ($1, $2) WHERE id = $3 "
    values = [@name, @img, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM continents
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.view_all()
    sql = "SELECT * FROM continents;"
    continents = SqlRunner.run(sql)
    return continents.map{|continent| Continent.new(continent)}
  end

  def self.view(id)
    sql ="SELECT * FROM continents WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return Continent.new(result.first)
  end

  def self.find( id )
    sql = "SELECT * FROM zombies
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Continent.new(results.first)
  end

  def view_countries()
    sql = "SELECT * FROM countries WHERE continent_id = $1"
    values = [@id]
    countries = SqlRunner.run(sql, values)
    return countries.map{|country| Country.new(country)}
  end

  def self.search(searched_word)
    sql = "SELECT * FROM continents WHERE name = $1"
    values = [searched_word.to_s()]
    continent = SqlRunner.run(sql, values)
    if continent.first == nil
      return nil
    else
      return Continent.new(continent.first)
    end
  end

end
