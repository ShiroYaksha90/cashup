require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.new(name: 'Jack', email: 'jack123@gmail.com', password: '123456')

  it 'check there is a name' do
    expect(user.name).to eql 'Jack'
  end
  it 'check there is email' do
    expect(user.email).to_not eql ''
    expect(user.email).to eql 'jack123@gmail.com'
  end
  it 'check password' do
    expect(user.password).to_not eql ''
    expect(user.password).to eql '123456'
  end
end
