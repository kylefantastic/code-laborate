require 'rails_helper'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end


describe 'Developer feature testing:', :type => :feature, js: true do
  include LoginHelpers
  feature 'Registration' do
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
  end

  feature 'Projects page' do
    before do
      Organization.create(name: Faker::Company.name, website_url: Faker::Internet.url, description: Faker::Lorem.sentence(3))
      Project.create(title: "Faked Title", description: Faker::Lorem.sentence(2), contact_name: Faker::Name.name, contact_email: Faker::Internet.email, contact_phone: Faker::PhoneNumber.phone_number, organization_id: 1)
    end

    context 'When viewing the projects page' do
      scenario 'a developer can see an unordered list that should contain projects' do
        user_login
        visit('/projects')
        expect(page.html).to have_css("ul")
      end
      scenario 'a developer can see the title of the project' do
        user_login
        visit('/projects')
        expect(page).to have_content "Faked Title"
      end
      scenario 'a developer sees a profile button' do
        user_login
        visit('/projects')
        expect(page).to have_link("Profile")
      end
    end
  end

  feature 'Profile page' do
    context 'When viewing the profile page' do
      scenario 'a developer can see their first name' do
        user_login
        click_link("Profile")
        expect(page).to have_content "New"
      end
      scenario 'a developer can see their last name' do
        user_login
        click_link("Profile")
        expect(page).to have_content "Person"
      end
      scenario 'a developer can see their public profile url' do
        user_login
        click_link("Profile")
        expect(page).to have_content "public.com"
      end
      scenario 'a developer can see their bootcamp' do
        user_login
        click_link("Profile")
        expect(page).to have_content "DBC"
      end
      scenario 'a developer can see their email' do
        user_login
        click_link("Profile")
        expect(page).to have_content "user@user.com"
      end
      scenario 'a developer can click an edit button' do
        user_login
        click_link("Profile")
        expect(page).to have_link("Edit Profile")
      end
    end


    xcontext 'when on the edit profile page' do
      scenario 'the developer can change their first_name' do
        user_login
        click_link("Profile")
        click_link("Edit Profile")
        fill_in 'first_name', with: "First"
        click_button 'Edit'
        expect(User.first.first_name).to eq "First"
      end
      scenario 'the developer can change their last_name' do
        user_login
        click_link("Profile")
        click_link("Edit Profile")
        fill_in 'last_name', with: "Last"
        click_button 'Edit'
        expect(User.first.last_name).to eq "Last"
      end
      scenario 'the developer can change their public_profile_url' do
        user_login
        click_link("Profile")
        click_link("Edit Profile")
        fill_in 'public_profile_url', with: "www.reddit.com"
        click_button 'Edit'
        expect(User.first.public_profile_url).to eq "www.reddit.com"
      end
      scenario 'the developer can change their bootcamp' do
        user_login
        click_link("Profile")
        click_link("Edit Profile")
        fill_in 'bootcamp', with: "None"
        click_button 'Edit'
        expect(User.first.bootcamp).to eq "None"
      end
      scenario 'the developer can change their email' do
        user_login
        click_link("Profile")
        click_link("Edit Profile")
        fill_in 'email', with: "another@one.com"
        click_button 'Edit'
        expect(User.first.email).to eq "another@one.com"
      end
      scenario 'the developer can change their password' do
        user_login
        click_link("Profile")
        click_link("Edit Profile")
        fill_in 'password', with: 'betterpassword'
        fill_in 'confirm password', with: 'betterpassword'
        click_button 'Edit'
        click_button 'Logout'
        user_login
        expect(page).to have_content("Invalid password")
      end
      scenario 'the developer can change their '
    end
  end
end
