require 'sequel'

class Patient < Sequel::Model
  plugin :validation_helpers

  one_to_many :family_members

end
