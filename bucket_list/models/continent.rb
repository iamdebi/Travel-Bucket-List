require_relative('../db/sql_runner')

class Continent

  attr_reader :id
  attr_accessor :name

  def initialize(details)
    @id = details['id'] if details['id']
    @name = details['name']
  end

  def save()
    sql = "INSERT INTO continents (name)
     VALUES ($1) RETURNING id"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i()
  end

  def self.delete_all()
    sql = "DELETE FROM continents"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE continents SET
    name = $1 WHERE id = $2 "
    values = [@name, @id]
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
    attractions = SqlRunner.run(sql)
    return attractions.map{|attraction| Attraction.new(attraction)}
  end

  def self.view(id)
    sql ="SELECT * FROM continents WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return result.first
  end

  def view_countries()
    sql = "SELECT * FROM countries where continent_id = $1"
    values = [@id]
    countries = SqlRunner.run(sql, values)
    return countries.map{|country| Country.new(country)}
  end

end
