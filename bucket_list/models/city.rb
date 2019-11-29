require_relative('../db/sql_runner')

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



end
