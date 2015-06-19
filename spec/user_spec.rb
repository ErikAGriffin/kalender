
describe User do

  it 'exists' do
    user = User.new(email:'test@email.com',password:'mypass',role:0)
    user.save
    expect(user).to exist
  end

end
