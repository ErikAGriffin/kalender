require 'sequel'

env = ENV['DB_ENV_VAR'] || 'development'


DB = Sequel.connect(ENV['DATABASE_URL'] || "postgres://localhost/kalender_#{env}")


require './lib/model/user'
require './lib/model/patient'
require './lib/model/family_member'
