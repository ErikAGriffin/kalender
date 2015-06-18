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

  # Question: How to change the value of what is :patient below, based
  # on the role assigned to the user?  Or perhaps based on an input?
  # The 'one_to_one' method was undefined within the after_save method.
  one_to_one :patient

  def after_save
    super
  end

end
