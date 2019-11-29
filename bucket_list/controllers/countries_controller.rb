require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/country.rb')
also_reload( '../models/*' )

get '/countries' do
  @countries = Country.view_all()
  erb(:"/country/index")
end

get '/countries/:id' do
  @country = Country.view(params['id'].to_i)
  erb(:"/country/show")
end
