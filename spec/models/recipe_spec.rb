require 'rails_helper'

RSpec.describe 'Recipe', type: :model do
  subject do
    Recipe.new(
      name: 'Maple Cupcakes ',
      preparation_time: '20 min',
      cooking_time: '15 min',
      description: 'Preheat the oven to 350 degrees F (175 degrees C). Grease two 12-cup muffin tins.',
      public: true
    )
  end
  before { subject.save }
  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'preparation_time should be present' do
    subject.preparation_time = nil
    expect(subject).to_not be_valid
  end
  it 'cooking_time should be present' do
    subject.cooking_time = nil
    expect(subject).to_not be_valid
  end
  it 'description should be present' do
    subject.description = nil
    expect(subject).to_not be_valid
  end
end