require 'rails_helper'

RSpec.feature 'Transactions', type: :feature do
  it 'checks content when a transaction is created' do
    visit '/users/new?'
    fill_in :user_name, with: 'Bello'
    click_on 'Sign Up'
    visit transactions_path
    click_on 'New Transaction'
    fill_in :transaction_name, with: 'Fruits'
    fill_in :transaction_amount, with: '500'
    click_on 'Create Transaction'
    expect(page).to have_text('New Transaction')
  end
end
