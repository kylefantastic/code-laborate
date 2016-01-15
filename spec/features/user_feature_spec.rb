require 'rails_helper'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

describe 'feature testing', :type => :feature, js: true do
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

    scenario 'if user doesnt enter all fields error message is raised' do
      org_user_login
      visit(new_organization_path)
      click_button 'Save Organization'
      expect(page).to have_content('2 errors prohibited this project from being saved:')
    end

     scenario 'if user doesnt fill out the Organization Name error message is raise' do
      org_user_login
      visit(new_organization_path)
      fill_in 'Website', :with => 'www.rootedincommunity.org'
      fill_in 'Description', :with => 'cool@user.com'
      click_button 'Save Organization'
      expect(page).to have_content('1 error prohibited this project from being saved:')
    end
  end

  feature 'logged in' do
    scenario 'a user can link to their profile from the projects page' do
      org_user_login
      new_org
      add_project
      wait_for_ajax
      click_link "Profile"
      wait_for_ajax
      expect(page).to have_content('Rooted in Community')
    end
  end
end

  # feature 'user delete' do
  #   xscenario 'can delete their account by deleting organization' do
  #     org_user_login
  #     new_org
  #     click_button 'Delete Account'
  #     expect(page).to have_content("Welcome!")
  #   end
  #   # Commented out because I am not sure how to have the user interact with the popup windows
  # end
# feature 'registration' do
#   context 'as an organization representative' do
#     scenario 'a user can sign up' do
#       visit(root_path)
#       click_link ('Sign up')
#       click_button('Sign Up As Organization')
#       wait_for_ajax
#       fill_in 'First name', :with => 'Danielle'
#       fill_in 'Last name', :with => 'Cameron'
#       fill_in 'Email', :with => 'dc@user.com'
#       fill_in 'Password', :with => 'password'
#       fill_in 'Password confirmation', :with => 'password'
#       find(:css, '#org-agree').set(true)
#       click_button 'Sign up'
#       wait_for_ajax
#       expect(page).to have_content('Sign Up Your Organization')
#     end
#   end
# end
