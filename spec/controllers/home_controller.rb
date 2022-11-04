require 'rails_helper'
require_relative '../support/devise'

RSpec.describe HomeController, type: :controller do
  describe 'GET /' do
    login_account

    context 'from login account' dependencies
    it 'should return 200:OK' do
      get :show
      expect(response).to have_http_status(:success)
    end
  end
end