require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/attraction')
also_reload( '../models/*' )
