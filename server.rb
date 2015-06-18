require 'hobbit'
require 'hobbit/hole'
require 'multi_json'
require 'bcrypt'
require './custom-hobbit'

class Server < Hobbit::Base
  include Hobbit::Hole

  require './database_setup'


  get '/' do
    render_static 'home.html'
  end

  post '/newpatient' do
    new_user = MultiJson.load(request.body, symbolize_keys: true)
    patient = new_user[:patient]
    family = new_user[:familyMember]
    p patient
    p family

  end

  # get '*' do
  #   render_static 'index.html'
  # end


end
