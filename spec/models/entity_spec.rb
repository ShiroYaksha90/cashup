require 'rails_helper'

RSpec.describe Entity, type: :model do
  user = User.create(name: 'Basim', email: 'aljazaeribasim@gmail.com', password: '123123',
                     password_confirmation: '123123')
  e = Entity.new(name: 'test', amount: 100, author_id: user.id)

  it 'check it has a name' do
    e.name = 'test'
  end
  it 'check it has an amount' do
    e.amount = 100
  end
  it 'check it has an author_id' do
    e.author_id = user.id
  end
end
