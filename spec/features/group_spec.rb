require 'rails_helper'

RSpec.feature 'Transactions', type: :feature do
  it 'checks content when a transaction is created' do
    visit '/users/new?'
    fill_in :user_name, with: 'Bello'
    click_on 'Sign Up'
    visit groups_path
    click_on 'New Group'
    click_on 'Create Group'
    fill_in :group_name, with: 'Food'
    click_on 'Create Group'
    expect(page).to have_content('New Group')
  end
end
