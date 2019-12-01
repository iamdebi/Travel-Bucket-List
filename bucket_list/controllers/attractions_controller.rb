require('sinatra')
require('sinatra/contrib/all')
require('pry')

require_relative('../models/attraction')
require_relative('../models/city')
also_reload( '../models/*' )


#index
get '/attractions' do
  @attractions = Attraction.view_all()
  erb(:"/attraction/index")
end

 #new
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
  new_attraction = Attraction.new(params)
  new_attraction.save()
  redirect'/attractions'
end

# edit
get '/attractions/:id/edit' do
  id = params['id'].to_i()
  @cities = City.view_all()
  @attraction = Attraction.view(id)
  erb(:"/attraction/edit")
end

# update
post '/attractions/:id' do
  attraction = Attraction.new(params)
  attraction.update()
  redirect '/attractions'

end

# delete
post '/attractions/:id/delete' do
  id = params['id'].to_i()
  delete_attraction = Attraction.view(id)
  delete_attraction.delete
  redirect '/attractions'
end
