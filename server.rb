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

  # Currently MUST sign up family member at same time,
  # so they are tied to a single resource.
  post '/newpatient' do
    new_user_pair = MultiJson.load(request.body, symbolize_keys: true)
    register_new_user_pair(new_user_pair)
    'Worked!'
  end

  # get '*' do
  #   render_static 'index.html'
  # end


end
