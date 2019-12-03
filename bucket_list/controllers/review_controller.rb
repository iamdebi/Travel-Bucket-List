require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/attraction')
require_relative('../models/review')
also_reload( '../models/*' )

# index
get '/reviews' do
  @reviews = Review.view_all
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
  @review = Review.view(id)
  erb(:"/review/show")
end

# create
post '/reviews' do
  new_review = Review.new(params)
  new_review.save()
  erb(:"/review/added")
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
