require 'rails_helper'

RSpec.describe Group, type: :model do
  user = User.create(name: 'Basim', email: 'aljazaeribasim@gmail.com', password: '123123',
  password_confirmation: '123123')
  group = Group.new(name: 'Food', icon: 'fa fa', author_id: user.id)
  it 'check it has a name' do
    group.name = 'Food'
  end
  it 'check it has an icon' do
    group.icon = 'fa fa'
  end
  it 'check it has an author_id' do
    group.author_id = user.id
  end
end
