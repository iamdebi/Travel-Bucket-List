require('sinatra')
require('sinatra/contrib/all')


require_relative('../models/country.rb')
require_relative('../models/continent.rb')
also_reload( '../models/*' )


#index
get '/countries' do
  @countries = Country.view_all()
  erb(:"/country/index")
end

#new
get '/countries/new' do
  @continents = Continent.view_all()
  erb(:"/country/new")
end

#show
get '/countries/:id' do
  @country = Country.view(params['id'].to_i)
  erb(:"/country/show")
end

#create
post '/countries' do
  country = params
  new_country = Country.new(country)
  new_country.save()
  redirect '/countries'
end

#edit
get '/countries/:id/edit' do
  id = params['id'].to_i()
  @country = Country.view(id)
  @continents = Continent.view_all()
  erb(:"/country/edit")
end

#update
post '/countries/:id' do
  country = Country.new(params)
  country.update()
  redirect '/countries'
end

#delete
post '/countries/:id/delete' do
  id = params['id'].to_i()
  delete_country = Country.view(id)
  delete_country.delete
  redirect '/countries'
end
