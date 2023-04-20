require 'rails_helper'

RSpec.describe 'Foods', type: :model do
  User.new(
    id: 1,
    name: 'Newton'
  )
  subject do
    Food.new(
      name: 'beef',
      measurement_unit: 'kg',
      price: 220.0,
      quantity: 2,
      user_id: 1
    )
  end
  before { subject.save }
  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'measurement_unit should be present' do
    subject.measurement_unit = nil
    expect(subject).to_not be_valid
  end
  it 'price should be present' do
    subject.price = nil
    expect(subject).to_not be_valid
  end
  it 'quantity should be present' do
    subject.quantity = nil
    expect(subject).to_not be_valid
  end
end