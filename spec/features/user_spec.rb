require 'rails_helper'

RSpec.feature 'UserFeatures', type: :feature do
  context 'not logged in' do
    it 'loads login-page' do
      visit welcome_path
      expect(page).to have_content 'Keep your spendings in check'
    end

    it 'loads signup-page' do
      visit new_user_path
      expect(page).to have_content 'Name'
    end
  end
end