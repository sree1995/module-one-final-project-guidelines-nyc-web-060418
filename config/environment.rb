require 'bundler'
Bundler.require


ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
ActiveRecord::Base.connection

require_all 'lib'
require_all 'app'
