require 'rails_helper'

RSpec.describe Group, type: :model do
  it 'checks if it belongs to user model' do
    should belong_to(:user)
  end

  it 'validates the name' do
    should validate_presence_of(:name)
  end

  it "checks if name not empty" do
    @group = Group.create(name: '')
    expect(@group.valid?).not_to eq true
  end

  it 'checks if it has one image' do
    should have_one_attached(:image)
  end
end
