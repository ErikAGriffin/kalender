require 'sequel'

class Patient < Sequel::Model
  plugin :validation_helpers

  one_to_many :family_members

  one_to_one :user, :key => :id

end
