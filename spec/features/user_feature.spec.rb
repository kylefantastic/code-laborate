require 'rails_helper'

describe 'feature testing', :type => :feature do

  feature 'the home page' do

    scenario 'a user can see a register link' do
      visit('/home')
      expect(page).to have_link "Register"
    end

    scenario 'a user can redirect to the registration page' do
      visit('/home')
      click_link 'Register'
      expect(page).to have_content "Please choose what type of user you are"
    end
  end
end
