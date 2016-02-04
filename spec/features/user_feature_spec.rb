require 'rails_helper'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

describe 'User feature testing', :type => :feature, js: true do
  include LoginHelpers
  include FillInHelpers
  feature 'the home page' do
    context 'no user is logged in' do
      scenario 'a user can see a register link' do
        visit(root_path)
        expect(page).to have_link "Sign up"
      end

      scenario 'a user can redirect to the registration page' do
        visit(root_path)
        click_link 'Sign up'
        expect(page).to have_content "Sign Up As Organization"
      end
    end
  end

  feature 'login' do
    scenario 'a registered user can log in' do
      org_user_login
      expect(page).to have_link('Logout')
    end
  end

  feature 'organization sign-up' do
    scenario 'a organization representative can sign up' do
      visit(root_path)
      click_link ('Sign up')
      find("#org-signup-button")
      click_button('Sign Up As Organization')
      fill_in 'First name', :with => 'Danielle'
      fill_in 'Last name', :with => 'Cameron'
      fill_in 'Email', :with => 'dc@user.com'
      fill_in 'Password', :with => 'password'
      fill_in 'Password confirmation', :with => 'password'
      click_button 'Sign up'
      expect(page).to have_content('Sign Up Your Organization')
    end

    scenario 'a user can see an organization form' do
      org_user_login
      visit(new_organization_path)
      expect(page).to have_selector('#new_org_form')
    end

    scenario 'a user can fill out form and see the organization profile' do
      org_user_login
      new_org
      expect(page).to have_content('Rooted in Community')
    end
  end

  feature 'logged in' do
    scenario 'a user can link to their profile from the projects page' do
      org_user_login
      find(".alert-success")
      new_org
      find(".org-partial")
      add_project
      find(".project-profile")
      click_link "Profile"
      find(".org-partial")
      expect(page).to have_content('Rooted in Community')
    end
  end

end



