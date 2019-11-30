require('sinatra')
require('sinatra/contrib/all')
require('pry')

require_relative('../models/city')
require_relative('../models/country.rb')
also_reload( '../models/*' )

 #index
 get '/cities' do
   @cities = City.view_all()
   erb(:"/city/index")
 end

 # #new
 get '/cities/new' do
   @country = Country.view_all()
   erb(:"/city/new")
 end

 #show
 get '/cities/:id' do
   id = params['id'].to_i
   @city = City.view(id)
   erb(:"/city/show")
 end

 # create
 post '/cities' do
   new_city = City.new(params)
   new_city.save()
   redirect'/cities'
 end

 # edit
 get '/cities/:id/edit' do
   id = params['id'].to_i()
   @countries = Country.view_all()
   @city = City.view(id)
   erb(:"/city/edit")
 end

 # # update
 # post do
 #
 # end

 # delete
 post '/cities/:id/delete' do
   id = params['id'].to_i()
   delete_city = City.view(id)
   delete_city.delete()
   redirect '/cities'
 end
