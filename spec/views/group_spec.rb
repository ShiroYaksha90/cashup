require 'rails_helper'

RSpec.feature 'Groups', type: :system do
  include Devise::Test::IntegrationHelpers
  before do
    @user = User.create(
      name: 'Basim',
      email: 'user@example.com',
      password: 'password'
    )
    sign_in @user
    @group =
      Group.create(
        name: 'Food',
        icon: 'www.foodimg.com',
        author: @user
      )
    @entity =
      Entity.create(
        name: 'Stake',
        amount: 25,
        author: @user
      )
    @group.entities << @entity
  end

  describe '#index' do
    it 'should display categories' do
      visit user_path
      expect(page).to have_content(@group.name)
      expect(page).to have_css('img')
      expect(page).to have_content(@group.entities.sum(:amount))
      expect(page).to have_content('Add new category')
    end
  end
end
