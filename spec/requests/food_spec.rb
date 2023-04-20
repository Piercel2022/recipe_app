require 'rails_helper'

RSpec.describe 'Food', type: :request do
  describe 'Get /index' do
    it 'returns http success' do
      @user = User.new(name: 'Newton')
      @food = Food.new(name: 'beef', measurement_unit: 'kg', price: 220.0, quantity: 2, user_id: @user.id)
      get foods_path
      expect(response).to have_http_status(302)
    end
  end
end
