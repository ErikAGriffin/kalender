require 'sequel'

env = ENV['KAL_DB_ENV'] || 'development'


DB = Sequel.connect(ENV['DATABASE_URL'] || "postgres://localhost/kalender_#{env}")


require './lib/model/user'
require './lib/model/patient'
require './lib/model/family_member'
