require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/country.rb')
also_reload( '../models/*' )

#index
get '/countries' do
  @countries = Country.view_all()
  erb(:"/country/index")
end

#new
get '/countries/new' do

end

#show
get '/countries/:id' do
  @country = Country.view(params['id'].to_i)
  erb(:"/country/show")
end

#create
post '/countries' do

end

#edit
get '/countries/:id/edit' do

end

#update
post '/countries/:id' do

end

#delete
post '/countries/:id/delete' do

end
