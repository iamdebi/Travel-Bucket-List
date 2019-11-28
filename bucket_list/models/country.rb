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
    sql = "DELeTE FROM countries"
    SqlRunner.run(sql, values)
  end

end
