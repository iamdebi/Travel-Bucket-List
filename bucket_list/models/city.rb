require_relative('../db/sql_runner')
require_relative('attraction')
require_relative('country')

class City

  attr_reader :id, :country_id
  attr_accessor :name, :visit

  def initialize(details)
    @id = details['id'] if details['id']
    @name = details['name']
    @country_id = details['country_id']
    @visit = details['visit']
  end

  def save()
    sql = "INSERT INTO cities
    (name, country_id, visit)
     VALUES ($1, $2, $3) RETURNING id"
    values = [@name, @country_id, @visit]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i()
  end

  def self.delete_all()
    sql = "DELETE FROM cities"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE cities SET
    (name, country_id, visit) = ($1, $2, $3) WHERE id = $4 "
    values = [@name, @continent_id, @visit, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM cities
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.view_all()
    sql = "SELECT * FROM cities;"
    cities = SqlRunner.run(sql)
    return cities.map{|city| City.new(city)}
  end

  def self.view(id)
    sql ="SELECT * FROM cities WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return City.new(result.first)
  end

  def view_attractions()
    sql = "SELECT * FROM attractions where city_id = $1"
    values = [@id]
    attractions = SqlRunner.run(sql, values)
    return attractions.map{|attraction| Attraction.new(attraction)}
  end

  def country()
    sql ="SELECT * FROM countries WHERE id = $1;"
    values = [@country_id]
    country = SqlRunner.run(sql,values)
    return Country.new(country.first)
  end

  def self.visited
    sql = "SELECT * FROM cities WHERE visit = $1;"
    values = [true]
    cities = SqlRunner.run(sql, values)
    return cities.map{|city| City.new(city)}
  end


  def self.to_visit
    sql = "SELECT * FROM cities WHERE visit = $1;"
    values = [false]
    cities = SqlRunner.run(sql, values)
    return cities.map{|city| City.new(city)}
  end

  def self.search(searched_word)
    sql = "SELECT * FROM cities WHERE name = $1"
    values = [searched_word.to_s()]
    city = SqlRunner.run(sql, values)
    if city.first == nil
      return nil
    else
      return City.new(city.first)
    end
  end

end
