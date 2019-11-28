require_relative('../models/continent')
require_relative('../models/country')
require_relative('../models/city')
# require_relative('../models/attraction')
require('pry')

Continent.delete_all()

continent1 = Continent.new({
  'name' => 'Europe'
})
continent1.save()

continent2 = Continent.new({
  'name' => 'Africa'
  })
continent2.save()

continent3 = Continent.new({
  'name' => 'Asia'
  })
continent3.save()

continent4 = Continent.new({
  'name' => 'North America'
  })
continent4.save()

continent5 = Continent.new({
  'name' => 'South America'
  })
continent5.save()

continent6 = Continent.new({
  'name' => 'Australlia'
  })
continent6.save()

continent7 = Continent.new({
  'name' => 'Antarctica'
  })
continent7.save()

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


  city1 = City.new({
    'name' => 'Berlin',
    'country_id' => country1.id,
    'visit' => false
    })
    city1.save()

binding.pry
nil
