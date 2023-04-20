require 'rails_helper'

RSpec.describe 'Food', type: :system do
  user = User.create(name: 'Newton', email: 'altontonnalumasa@gmail.com', password: '123456')
  subject do
    Food.new(name: 'beef', measurement_unit: 'kg', price: 220.0, quantity: 2, user_id: user.id)
  end
  before { subject.save }
  describe 'Index page' do
    it 'displays food name' do
      visit foods_path
      page.has_content?('beef')
    end
    it 'displays measurement unit' do
      visit foods_path
      page.has_content?('kg')
    end
    it 'displays copyright' do
      visit foods_path
      page.has_content?('Created by Pierre and Newton Alumasa © 2023')
    end
    it 'displays a button' do
      visit foods_path
      page.has_button?('Add Food')
    end
  end
end