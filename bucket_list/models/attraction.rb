require_relative('../db/sql_runner')
require_relative('city')
require_relative('review')


class Attraction

  attr_reader :id, :city_id
  attr_accessor :name

  def initialize(details)
    @id = details['id'] if details['id']
    @name = details['name']
    @city_id = details['city_id']
  end

  def save
    sql = "INSERT INTO attractions
    (name, city_id)
    VALUES ($1, $2) RETURNING id;"
    values = [@name, @city_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i()
  end

  def self.delete_all()
    sql = "DELTE FROM attractions"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE attractions SET
    (name, city_id) =
    ($1, $2) WHERE id = $3 "
    values = [@name, @city_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM attractions
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.view_all()
    sql = "SELECT * FROM attractions"
    attractions = SqlRunner.run(sql)
    return attractions.map{|attraction| Attraction.new(attraction)}
  end

  def self.view(id)
    sql ="SELECT * FROM attractions WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return Attraction.new(result.first)
  end

  def city
    sql = "SELECT * FROM cities WHERE id = $1"
    values = [@city_id]
    result = SqlRunner.run(sql, values)
    return City.new(result.first)
  end

  def reviews
    sql = "SELECT * FROM reviews WHERE attraction_id = $1"
    values = [@id]
    reviews = SqlRunner.run(sql, values)
    return reviews.map{|review| Review.new(review)}
  end

  def avg_review_rating
    review_total = 0
    reviews = self.reviews
    if reviews.first != nil
      for review in reviews
        review_total += review.review_rating
      end
    else
      return reviews = 0
    end
    average = review_total/reviews.size()
    return average
  end

  def avg_out_5
    self.avg_review_rating + 1
  end

end
