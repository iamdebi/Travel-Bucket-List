require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/attraction')
require_relative('../models/review')
also_reload( '../models/*' )

# index
get '/reviews' do

  erb(:"/review/index")
end

# new
get '/reviews/new' do

  erb(:'/review/new')
end

# show
get '/reviews/:id' do
  id = params['id'].to_i()

  erb(:"/review/show")
end

# create
post '/reviews' do

  redirect '/reviews'
end

# edit
get do

end

# update
post do

end

# delete
post do

end
