require 'rails_helper'

RSpec.describe 'Entities', type: :request do
  include Devise::Test::IntegrationHelpers

  describe 'GET /new' do
    before do
      @user = User.create(name: 'Basim', email: 'aljazaeribasim@gmail.com', password: '123123',
                          password_confirmation: '123123')
      sign_in @user
      @group = Group.create!(name: 'category', icon: 'img', author_id: @user.id)
      get new_user_entity_path(@user, group_id: @group)
    end

    it 'response to html' do
      expect(response.content_type).to include 'text/html'
    end
  end
end
