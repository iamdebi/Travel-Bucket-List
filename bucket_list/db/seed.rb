require_relative('../models/continent')
require_relative('../models/country')
require_relative('../models/city')
require_relative('../models/attraction')
require_relative('../models/review')
require_relative('../models/search')


require('pry')

#only need continent.delete_all as the others delete on cascade
Continent.delete_all()

# Continents

continent1 = Continent.new({
  'name' => 'Europe',
  'img' => '/images/continents/europeglobe.png'
})
continent1.save()

continent2 = Continent.new({
  'name' => 'Africa',
  'img' => '/images/continents/africaglobe.png'
  })
continent2.save()

continent3 = Continent.new({
  'name' => 'Asia',
  'img' => '/images/continents/asiaglobe.png'
  })
continent3.save()

continent4 = Continent.new({
  'name' => 'North America',
  'img' => '/images/continents/northamericaglobe.png'
  })
continent4.save()

continent5 = Continent.new({
  'name' => 'South America',
  'img' => '/images/continents/southamericaglobe.png'
  })
continent5.save()

continent6 = Continent.new({
  'name' => 'Australlia',
  'img' => '/images/continents/oceaniaglobe.png'
  })
continent6.save()

continent7 = Continent.new({
  'name' => 'Antarctica',
  'img' => '/images/continents/Antarctica.png'
  })
continent7.save()

# Countries

country1 = Country.new({
  'name' => "Germany",
  'continent_id' => continent1.id
  })
country1.save()

country2 = Country.new({
  'name' => "USA",
  'continent_id' => continent4.id
  })
  country2.save()

country3 = Country.new({
  'name' => "South Africa",
  'continent_id' => continent2.id
  })
  country3.save()

country4 = Country.new({
  'name' => "Australia",
  'continent_id' => continent6.id
  })
  country4.save()

country5 = Country.new({
  'name' => "Japan",
  'continent_id' => continent3.id
  })
  country5.save()

country6 = Country.new({
  'name' => "Brazil",
  'continent_id' => continent5.id
  })
  country6.save()

country7 = Country.new({
  'name' => "France",
  'continent_id' => continent1.id
  })
  country7.save()

# Cities

city1 = City.new({
  'name' => 'Berlin',
  'country_id' => country1.id,
  'visit' => false
  })
  city1.save()

city2 = City.new({
  'name' => 'Paris',
  'country_id' => country7.id,
  'visit' => true
  })
  city2.save()

city3 = City.new({
  'name' => 'Tokyo',
  'country_id' => country5.id,
  'visit' => true
  })
  city3.save()

city4 = City.new({
  'name' => 'Rio',
  'country_id' => country6.id,
  'visit' => false
  })
  city4.save()

city5 = City.new({
  'name' => 'Sydney',
  'country_id' => country4.id,
  'visit' => true
  })
  city5.save()

city6 = City.new({
  'name' => 'New York',
  'country_id' => country2.id,
  'visit' => false
  })
  city6.save()

city7 = City.new({
  'name' => 'Nice',
  'country_id' => country7.id,
  'visit' => false
  })
  city7.save()

city8 = City.new({
  'name' => 'Frankfurt',
  'country_id' => country1.id,
  'visit' => false
  })
  city8.save()

city9 = City.new({
  'name' => 'Perth',
  'country_id' => country4.id,
  'visit' => true
  })
  city9.save()

city10 = City.new({
  'name' => 'Johannesburg',
  'country_id' => country3.id,
  'visit' => true
  })
  city10.save()

  #  Atrractions
attraction1 = Attraction.new({
  'name' => "Berlin Wall",
  'city_id' => city1.id
  })
  attraction1.save()

attraction2 = Attraction.new({
  'name' => "Statue of Liberty",
  'city_id' => city6.id
  })
  attraction2.save()

attraction3 = Attraction.new({
  'name' => "Eiffel Tower",
  'city_id' => city2.id
  })
  attraction3.save()

attraction4 = Attraction.new({
  'name' => "Empire State Building",
  'city_id' => city6.id
  })
  attraction4.save()

attraction5 = Attraction.new({
  'name' => "Times Square",
  'city_id' => city6.id
  })
  attraction5.save()

attraction6 = Attraction.new({
  'name' => "sydney opera house",
  'city_id' => city5.id
  })
  attraction6.save()


attraction7 = Attraction.new({
  'name' => "Check Point Charlie",
  'city_id' => city1.id
  })
  attraction7.save()

attraction8 = Attraction.new({
  'name' => "Louvre",
  'city_id' => city2.id
  })
  attraction8.save()

attraction9 = Attraction.new({
  'name' => "Christ The Redeemer",
  'city_id' => city4.id
  })
  attraction9.save()

review1 = Review.new({
  'title' => 'Would go again',
  'review' => 'Excellent, loved every momonemt, well worth a visit',
  'review_rating' => 4,
  'attraction_id' => attraction7.id
  })
  review1.save()

review2 = Review.new({
  'title' => 'enjoyable',
  'review' => 'Good, would visit again',
  'review_rating' => 3,
  'attraction_id' => attraction8.id
  })
  review2.save()

review3 = Review.new({
  'title' => 'did not enjoy',
  'review' => 'will not be back',
  'review_rating' => 1,
  'attraction_id' => attraction9.id
  })
  review3.save()

review4 = Review.new({
  'title' => 'would never recommend',
  'review' => 'Very big let down',
  'review_rating' => 0,
  'attraction_id' => attraction1.id
  })
  review4.save()

review5 = Review.new({
  'title' => 'Would go again',
  'review' => 'Excellent, loved every momonemt, well worth a visit',
  'review_rating' => 4,
  'attraction_id' => attraction2.id
  })
  review5.save()

review6 = Review.new({
  'title' => 'Would go again',
  'review' => 'Excellent, loved every momonemt, well worth a visit',
  'review_rating' => 4,
  'attraction_id' => attraction3.id
  })
  review6.save()

review7 = Review.new({
  'title' => 'Would go again',
  'review' => 'Excellent, loved every momonemt, well worth a visit',
  'review_rating' => 4,
  'attraction_id' => attraction4.id
  })
  review7.save()

review8 = Review.new({
  'title' => 'Would go again',
  'review' => 'Excellent, loved every momonemt, well worth a visit',
  'review_rating' => 4,
  'attraction_id' => attraction5.id
  })
  review8.save()

review8 = Review.new({
  'title' => 'Would go again',
  'review' => 'Excellent, loved every momonemt, well worth a visit',
  'review_rating' => 4,
  'attraction_id' => attraction6.id
  })
  review8.save()

review9 = Review.new({
  'title' => 'was okay',
  'review' => 'enjoied it but would never go out of my way to go',
  'review_rating' => 2,
  'attraction_id' => attraction7.id
  })
  review9.save()


binding.pry
nil
