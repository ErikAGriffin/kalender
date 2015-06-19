require 'sequel'

class User < Sequel::Model
  include BCrypt
  plugin :validation_helpers

  def validate
    super
    validates_presence [:email, :password_hash, :role]
    validates_unique :email
    validates_format /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, :email, message: 'not a valid email'
  end

  def password
    @password ||= Password.new(self.password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  # Obviously the user will only be tied to either a patient
  # or a family member. If attempting to access the wrong
  # type, 'nil' will simply be returned.
  one_to_one :patient, :key => :id
  one_to_one :family_member, :key => :id

  def after_save
    super
  end

end
