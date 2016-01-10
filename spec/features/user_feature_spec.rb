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
      expect(page).to have_link('Logout')
    end
  end

  feature 'organization sign-up' do
    scenario 'a user can see a organization form' do
      org_user_login
      visit(new_organization_path)
      expect(page).to have_selector('#new_org_form')
    end

    scenario 'a user can fill out form and see the organization profile' do
      org_user_login
      visit(new_organization_path)
      fill_in 'Organization Name', :with => 'Rooted in Community'
      fill_in 'Website', :with => 'www.rootedincommunity.org'
      fill_in 'Description', :with => 'cool@user.com'
      click_button 'Save Organization'
      expect(page).to have_content('Rooted in Community')
    end

  end

  feature 'create project' do
    before :each do
      org_user_login
      @organization = Organization.create(name:"Fishy", website_url:"www.google.com", description:"I like saving fish")
     p "This is the organization"
     p @organization

    end
    scenario 'a user can click the create projects button' do
      visit(organization_path(@organization))
      # sleep(6)
      expect(page).to have_button('New Project')
    end

    scenario 'a user can enter and submit project' do
      # You had new_product_path. :D
      visit(new_project_path)
      fill_in 'Title', :with => 'Toolshed'
      fill_in 'Description', :with => 'We are looking for someone to create a lesson and resource-sharing website'
      fill_in 'contact_name', :with => 'Kim'
      fill_in 'contact_email', :with => 'dude@dude.com'
      fill_in 'contact_phone', :with => '555-555-5555'
      click_button 'Submit'
      expect(page).to have_content('Project Page')
    end
  end


end

#closes feature testing
