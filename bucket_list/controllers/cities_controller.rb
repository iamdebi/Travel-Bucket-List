require('sinatra')
require('sinatra/contrib/all')
require('pry')

require_relative('../models/city')
require_relative('../models/country.rb')
require_relative('../models/attraction')
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

 get '/cities/visited' do
   @cities = City.visited()
   erb(:"/city/visited")
 end

 get '/cities/to-visit' do
   @cities = City.to_visit()
   erb(:"/city/to_visit")
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

 get '/cities/:id/attractions' do
   id = params['id']
   @city = City.view(id)
   erb(:"/city/attractions")
 end

 # update
 post '/cities/:id' do
   city = City.new(params)
   city.update()
   redirect '/cities'

 end

 # delete
 post '/cities/:id/delete' do
   id = params['id'].to_i()
   delete_city = City.view(id)
   delete_city.delete()
   redirect '/cities'
 end
