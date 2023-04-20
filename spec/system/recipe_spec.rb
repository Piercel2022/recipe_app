require 'rails_helper'

RSpec.describe 'Recipe', type: :system do
  user = User.new(name: 'Newton', email: 'altontonnalumasa@gmail.com', password: '123456')
  subject do
    Recipe.new(name: 'Maple Cupcakes', preparation_time: '20 min', cooking_time: '15 min',
               description: 'Preheat the oven to 350 degrees F (175 degrees C). Grease two 12-cup muffin tins.', user_id: user.id)
  end
  before { subject.save }
  describe 'recipe show page' do
    it 'displays recipe name' do
      visit recipe_path(:id)
      page.has_content?('Maple Cupcakes')
    end
    it 'displays recipe name' do
      visit recipe_path(:id)
      page.has_button?('Generate shopping list')
    end
    it 'displays recipe name' do
      visit recipe_path(:id)
      page.has_content?('chicken')
    end
  end
end
