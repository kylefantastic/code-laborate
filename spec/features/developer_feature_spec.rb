require 'rails_helper'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end


describe 'Developer feature testing:', :type => :feature, js: true do
  include LoginHelpers
  include FillInHelpers
  feature 'Registration' do
    context 'as a developer' do
      scenario 'a user can sign up' do
        visit(root_path)
        click_link ('Sign up')
        wait_for_ajax
        click_button('Sign Up As Developer')
        wait_for_ajax
        fill_in 'First name', :with => 'Kim'
        fill_in 'Last name', :with => 'Doe'
        fill_in 'Email', :with => 'user@user.com'
        fill_in 'Password', :with => 'password'
        fill_in 'Password confirmation', :with => 'password'
        find(:css, '#agree').set(true)
        click_button 'Sign up'
        wait_for_ajax

        expect(page).to have_content('Logout')
      end
    end
  end

  feature 'Projects page' do
    before :each do
      seed_categories
      user_login
      new_org
      add_project
      click_link("Logout")
      re_login
      click_link("Projects")
      # sleep(1)
    end

    context 'When viewing the projects page' do
      scenario 'a developer can see an unordered list that should contain projects' do
        # Do not remove this sleep(.05), without it the test breaks
        sleep(0.5)
        expect(page.html).to have_css("ul")
      end
      scenario 'a developer can see the title of the project' do
        expect(page).to have_content "Toolshed"
      end
      scenario 'a developer sees a profile button' do
        expect(page).to have_link("Profile")
      end
    end
  end

  feature 'Project show page' do

    context 'When viewing the projects show page' do
    before do
      seed_categories
      org_user_login
      new_org
      add_project
      add_second_project
      click_link("Logout")
      user_login
      visit(projects_path)
      click_link("Selfie-Distributor")
      # Link to project "Selfie-Distributor"
    end
      scenario 'a developer can see the project information' do
        expect(page).to have_content "Selfie-Distributor"
        expect(page).to have_content "Narcissus"
        expect(page).to have_content "555-555-5551"
        expect(page).to have_content "2016-12-25"
        expect(page).to have_content "Share Beauty"
        expect(page).to have_content "We are looking for someone to look at me"
        expect(page).to have_content "Those with eyes"
        # Organization name is not showing correctly
      end
      scenario 'a developer can choose the project' do
        click_button("Choose Project")
        expect(page).to have_content "You have chosen this project"
      end
      scenario 'a developer cannot choose the project if they have already chosen a different project' do
        click_button("Choose Project")
        wait_for_ajax
        click_link("Projects")
        wait_for_ajax
        click_link("Toolshed")
        wait_for_ajax
        expect(page).to have_no_content("Choose Project")
      end
    end
  end

  feature 'Profile page' do
    before do
      seed_categories
      user_login
      click_link("Profile")
    end
    context 'When viewing the profile page' do
      scenario 'a developer can see their first name' do
        expect(page).to have_content "New"
      end
      scenario 'a developer can see their last name' do
        expect(page).to have_content "Person"
      end
      scenario 'a developer can see their public profile url' do
        expect(page).to have_content "public.com"
      end
      scenario 'a developer can see their bootcamp' do
        expect(page).to have_content "DBC"
      end
      scenario 'a developer can see their email' do
        expect(page).to have_content "user@user.com"
      end
      scenario 'a developer can click an edit button' do
        expect(page).to have_button("Edit Account")
      end
    end


    context 'when on the edit profile page' do
      before do
        seed_categories
        click_button("Edit Account")
      end

      scenario 'the developer can change their first_name' do
        fill_in 'user[first_name]', with: "First"
        click_button 'Update'
        expect(page).to have_content "First"
      end
      scenario 'the developer can change their last_name' do
        fill_in 'user[last_name]', with: "Last"
        click_button 'Update'
        expect(page).to have_content "Last"
      end
      scenario 'the developer can change their public_profile_url' do
        fill_in 'user[public_profile_url]', with: "www.reddit.com"
        click_button 'Update'
        expect(page).to have_content "www.reddit.com"
      end
      scenario 'the developer can change their bootcamp' do
        fill_in 'user[bootcamp]', with: "Crazy Camp"
        click_button 'Update'
        expect(page).to have_content "Crazy Camp"
      end
      scenario 'the developer can change their email' do
        fill_in 'user[email]', with: "another@one.com"
        click_button 'Update'
        expect(page).to have_content "another@one.com"
      end
    end
  end
end
# scenario 'the developer can change their password' do
#   fill_in 'password', with: 'betterpassword'
#   fill_in 'confirm password', with: 'betterpassword'
#   click_button 'Update'
#   click_button 'Logout'
#   user_login
#   expect(page).to have_content("Invalid password")
# end

# scenario 'a developer can complete a project' do
#   click_button("Choose Project")
#   wait_for_ajax
#   sleep(0.2)
#   click_button("Complete")
#   wait_for_ajax
#   sleep(0.2)
#   expect(page).to have_button("Choose Project")
# end
# scenario 'a developer can abandon a project' do
#   click_button("Choose Project")
#   wait_for_ajax
#   sleep(0.2)
#   click_button("Abandon Project")
#   wait_for_ajax
#   sleep(0.2)
#   expect(page).to have_button("Choose Project")
# end
