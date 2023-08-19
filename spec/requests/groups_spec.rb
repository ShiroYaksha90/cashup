require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  include Devise::Test::IntegrationHelpers

  describe 'GET /new' do
    before do
      @user = User.create(name: 'Basim', email: 'aljazaeribasim@gmail.com', password: '123123',
                          password_confirmation: '123123')
      sign_in @user
      get user_path
    end

    it 'response to html' do
      expect(response.content_type).to include 'text/html'
    end
  end
end
