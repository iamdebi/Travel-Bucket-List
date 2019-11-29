require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/city')
also_reload( '../models/*' )
