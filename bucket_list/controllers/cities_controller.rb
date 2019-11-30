require('sinatra')
require('sinatra/contrib/all')
require('pry')

require_relative('../models/city')
also_reload( '../models/*' )

 #index
 get '/cities' do
   @cities = City.view_all()
   erb(:"/city/index")
 end

 # #new
 # get do
 #
 # end

 #show
 get '/cities/:id' do
   id = params['id'].to_i
   @city = City.view(id)
   erb(:"/city/show")
 end

 # # create
 # post do
 #
 # end

 # # edit
 # get do
 #
 # end

 # # update
 # post do
 #
 # end

 # # delete
 # post do
 #
 # end
