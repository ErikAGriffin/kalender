require 'hobbit'
require 'hobbit/hole'
require 'multi_json'
require 'bcrypt'
require './custom-hobbit'

class Server < Hobbit::Base
  include Hobbit::Hole

  require './database_setup'

  get '/test' do
    # lookup other Sequel retrieval methods.
    # Specifically, one where I know field is unique so I dont
    # call .first at the end?
    # fam = User.where('id = ?', 'lahaugg@gmail.com').first
    fam = User[4]
    p fam
    puts "____" * 10
    # fam_thing = FamilyMember.where(user_id: fam.id).first
    # Okay.. so good so far..
    fam_thing = fam.family_member
    # Hm. Its just nil. No error, just nil.
    test = fam.patient
    p test
    puts '****' * 10
    p fam_thing
    puts "____" * 10
    pat = fam_thing.patient
    p pat
    puts "____" * 10
    # Okay interesting, this is where it stops.
    # It seems it is expecting a foreign key back
    # to the User, or I'm not sure right now.
    # But either way its expecting User to have
    # a 'patient_id' field.
    # user = pat.user
    p user
    put "-__-__" * 10
    'OH YAYS!'
  end


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

  get '*' do
    render_static 'index.html'
  end


end
