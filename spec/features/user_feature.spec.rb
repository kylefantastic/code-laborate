require 'rails_helper'
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

describe 'feature testing', :type => :feature, js: true do

  feature 'the home page' do

    scenario 'a user can see a register link' do
      visit('/home')
      expect(page).to have_link "Register"
    end

    scenario 'a user can redirect to the registration page' do
      visit('/home')
      click_link 'Register'
      expect(page).to have_content "Welcome to Codellaborate"
    end
  end
end
