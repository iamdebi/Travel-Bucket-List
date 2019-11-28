require_relative('../models/continent')
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

binding.pry
nil
