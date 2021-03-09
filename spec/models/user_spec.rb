require 'rails_helper'

RSpec.describe User, type: :model do
  it 'checks if user model has many groups' do
    should have_many(:groups)
  end

  it 'checks if user model has many transactions' do
    should have_many(:transactions)
  end

  it 'validates the name' do
    should validate_presence_of(:name)
  end

  it "checks if name not empty" do
    @user = User.create(name: '')
    expect(@user.valid?).not_to eq true
  end
end
