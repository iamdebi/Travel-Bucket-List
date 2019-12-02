require_relative('../db/sql_runner')
require_relative('attraction')

class Review

  attr_reader :id, :attraction_id
  attr_accessor :title, :review, :review_rating

  def initialize(details)
    @id = details['id'].to_i() if details['id']
    @title = details['title']
    @review = details['review']
    @review_rating = details['review_rating'].to_i()
    @attraction_id = details['attraction_id']
  end

  def save
    sql = "INSERT INTO reviews
    (title, review, review_rating, attraction_id)
    VALUES ($1, $2, $3, $4) RETURNING id;"
    values = [@title, @review, @review_rating, @attraction_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i()
  end

  def self.delete_all()
    sql = "DELTE FROM reviews"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE reviews SET
    (title, review, review_rating, attraction_id) =
    ($1, $2, $3, $4) WHERE id = $5 "
    values = [@tile, @review, @review_rating, @attraction_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM reviews
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.view_all()
    sql = "SELECT * FROM reviews"
    reviews = SqlRunner.run(sql)
    return reviews.map{|review| Review.new(review)}
  end

  def self.view(id)
    sql ="SELECT * FROM reviews WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return Review.new(result.first)
  end

  def city
    sql = "SELECT * FROM attractions WHERE id = $1"
    values = [@attraction_id]
    result = SqlRunner.run(sql, values)
    return Attraction.new(result.first)
  end

  def review_word
    case @review_rating.to_i()
    when 0
      return "Terrible"
    when 1
      return "Poor"
    when 2
      return "Okay"
    when 3
      return "Good"
    when 4
      return "Excellent"
    end
  end

end
