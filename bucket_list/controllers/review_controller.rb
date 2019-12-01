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
  @attractions = Attraction.view_all
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
get '/reviews/:id/edit' do

  erb(:"review/edit")
end

# update
post '/reviews/:id' do

  redirect '/reviews'
end

# delete
post '/reviews/:id/delete' do
  id = params['id'].to_i()
  delete_review = Review.view(id)
  delete_review.delete
  redirect '/reviews'
end
