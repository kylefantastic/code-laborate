require 'rails_helper'
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

describe 'feature testing', :type => :feature, js: true do
  feature 'the home page' do
    context 'no user is logged in' do
      scenario 'a user can see a register link' do
        visit('/')
        expect(page).to have_link "Sign up"
      end

      scenario 'a user can redirect to the registration page' do
        visit('/')
        click_link 'Sign up'
        expect(page).to have_content "blah"
      end
    end
    context 'a user is logged in' do
      scenario ''
    end
  end

  feature 'the '
end
