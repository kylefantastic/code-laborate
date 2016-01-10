require 'rails_helper'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

describe 'feature testing', :type => :feature, js: true do
  include LoginHelpers
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

  feature 'login' do
    scenario 'a registered user can log in' do
      org_user_login
user_feature_spec.rb
      expect(page).to have_link('Logout')
    end
  end

  feature 'organization sign-up' do
    scenario 'a user can see a organization form' do
      org_user_login
      visit(organizations_new_path)
      expect(page).to have_selector('#new_org_form')
    end
  end
    scenario 'a user can fill out form and see the organization profile' do
      org_user_login
      visit(organizations_new_path)
      fill_in 'Organization Name', :with => 'Rooted in Community'
      fill_in 'Website', :with => 'www.rootedincommunity.org'
      fill_in 'Description', :with => 'cool@user.com'

    end
end
#closes feature testing
