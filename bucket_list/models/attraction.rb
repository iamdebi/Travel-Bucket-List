require_relative('../db/sql_runner')

class Attraction

  attr_reader :id, :city_id
  attr_accessor :name, :review, :review_rating

  def initialize(details)
    @id = details['id'] if details['id']
    @name = details['name']
    @review = details['review']
    @review_rating = details['review_rating']
    @city_id = details['city_id']
  end

  def save
    sql = "INSERT INTO attractions
    (name, review, review_rating, city_id)
    VALUES ($1, $2, $3, $4) RETURNING id;"
    values = [@name, @review, @review_rating, @city_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i()
  end

  def self.delete_all()
    sql = "DELTE FROM attractions"
    SqlRunner.run(sql)
  end

end
