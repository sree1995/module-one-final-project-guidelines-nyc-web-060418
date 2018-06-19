require 'bundler'
Bundler.require


ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')

require_all 'lib'
require_all 'app'

#eastablishing connection with User class
#which is helping us establish database with
#all our tables and models
User.connection
