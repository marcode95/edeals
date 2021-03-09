require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it 'checks if it belongs to user model' do
    should belong_to(:user)
  end

  it 'validates the amount' do
    should validate_presence_of(:amount)
  end

  it "checks if name not empty" do
    @transaction = Transaction.create(name: '')
    expect(@transaction.valid?).not_to eq true
  end
end
