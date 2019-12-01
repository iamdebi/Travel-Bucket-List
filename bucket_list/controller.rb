require('sinatra')
require('sinatra/contrib/all')

require_relative('controllers/continents_controller')
require_relative('controllers/countries_controller')
require_relative('controllers/cities_controller')
require_relative('controllers/attractions_controller')
require_relative('controllers/review_controller')


get '/' do
  erb( :home )
end
