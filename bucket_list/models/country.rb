require_relative('../db/sql_runner')

class Country

  attr_reader :id, :continent_id
  attr_accessor :name

  def initialize(details)
    @id = details['id'] if details['id']
    @name = details['name']
    @continent_id = details['continent_id']
  end

  def save()
    sql = "INSERT INTO countries (name, continent_id)
    VALUES ($1, $2) RETURNING id;"
    values = [@name, @continent_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM countries"
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE countries SET
    (name, continent_id) = ($1, $2) WHERE id = $3 "
    values = [@name, @continent_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM countries
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

end
