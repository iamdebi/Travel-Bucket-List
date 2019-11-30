require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/attraction')
also_reload( '../models/*' )

#index
get '/attractions' do

end

# #new
get '/attractions/new' do

end

#show
get '/attractions/:id' do
  id = params['id'].to_i
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
