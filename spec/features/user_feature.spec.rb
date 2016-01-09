require 'rails_helper'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

describe 'feature testing', :type => :feature, js: true do
  feature 'the home page' do
    context 'no user is logged in' do
      scenario 'a user can see a register link' do
        visit(root_path)
        expect(page).to have_link "Sign up"
      end

      scenario 'a user can redirect to the registration page' do
        visit(root_path)
        click_link 'Sign up'
        expect(page).to have_content "Sign Up As Non-Profit"
      end
    end
    # context 'a user is logged in' do
    #   # before :each do
    #   #   user_login
    #   # end
    #   scenario 'can see logout' do
    #     # User.create!(first_name: 'New', last_name: 'Person', email: 'user@user.com', password: 'password')
    #     visit '/users/sign_in'
    #     within(".new_user") do
    #     fill_in 'Email', :with => 'user@user.com'
    #     fill_in 'Password', :with => 'password'
    #     end
    #     click_button 'Log in'
    #     expect(page).to have_link('Logout')
    #   end
    # end
  end

  feature 'registration' do
    context 'as a developer' do
      scenario 'a user can sign up' do
        visit(root_path)
        click_link ('Sign up')
        click_button('Sign Up As Developer')
        fill_in 'First name', :with => 'Kim'
        fill_in 'Last name', :with => 'Doe'
        fill_in 'Email', :with => 'user@user.com'
        fill_in 'Password', :with => 'password'
        fill_in 'Password confirmation', :with => 'password'
        click_button 'Sign up'
        expect(page).to have_content('Logged in as user@user.com')
      end
    end

    context 'as an organization representative' do
      scenario 'a user can sign up' do
        visit(root_path)
        click_link ('Sign up')
        click_button('Sign Up As Non-Profit')
        fill_in 'First name', :with => 'Danielle'
        fill_in 'Last name', :with => 'Cameron'
        fill_in 'Email', :with => 'dc@user.com'
        fill_in 'Password', :with => 'password'
        fill_in 'Password confirmation', :with => 'password'
        click_button 'Sign up'
        expect(page).to have_content('Sign up your organization')
      end
    end
  end

  feature 'organization sign-up' do
    scenario 'an organization representative can create an organization' do
      visit()
    end
  end
end
#closes feature testing
