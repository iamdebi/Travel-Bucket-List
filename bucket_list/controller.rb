require('sinatra')
require('sinatra/contrib/all')
require('pry')

require_relative('controllers/continents_controller')
require_relative('controllers/countries_controller')
require_relative('controllers/cities_controller')
require_relative('controllers/attractions_controller')
require_relative('controllers/review_controller')


get '/' do
  erb( :home )
end

post '/search/:id' do
  @continent = Continent.search(params['search'])
  @country = Country.search(params['search'])
  @city = City.search(params['search'])
  erb( :search )
end
