require 'rails_helper'

RSpec.describe 'User', type: :model do
  subject do
    User.new(
      name: 'Newton'
    )
  end
  before { subject.save }
  it 'Name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end