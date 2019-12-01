require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/attraction')
require_relative('../models/city')
also_reload( '../models/*' )


#index
get '/attractions' do
  @attractions = Attraction.view_all()
  erb(:"/attraction/index")
end

# #new
get '/attractions/new' do
  @cities = City.view_all
  erb(:"/attraction/new")
end

#show
get '/attractions/:id' do
  id = params['id'].to_i
  @attraction =Attraction.view(id)
  erb(:"/attraction/show")
end

# create
post '/attractions' do
  
  redirect'/attractions'
end

# edit
get '/attractions/:id/edit' do

end

# update
post '/attractions/:id' do

  redirect '/attractions'

end

# delete
post '/attractions/:id/delete' do

  redirect '/atractions'
end
