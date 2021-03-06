require 'rails_helper'

RSpec.describe User, type: :model do
  it 'validates the name' do
    should validate_presence_of(:name)
  end
  
  it 'checks if user model has many groups' do
    should have_many(:groups)
  end
  
  it 'checks if user model has many transactions' do
    should have_many(:transactions)
  end
end
