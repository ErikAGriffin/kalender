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

  def after_save
    super
    puts 'Hello!'
    if self.role == 0
      puts 'Hmm I would need the params here if I were'
      puts 'to create the patient entry in a hook.'
    elsif self.role == 1
    end
  end

end
