require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/continent.rb')
also_reload( '../models/*' )

get '/continents' do
  @continents = Continent.view_all()
  erb(:"/continent/index")
end

get '/continents/:id' do
  id = params['id'].to_i
  @continent = Continent.view(id)
  erb(:"/continent/show")
end
