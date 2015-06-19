require 'sequel'

class FamilyMember < Sequel::Model
  plugin :validation_helpers

  many_to_one :patient

  one_to_one :user, :key => :id

end
