require 'rails_helper'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end


describe 'Developer feature testing:', :type => :feature, js: true do
  include LoginHelpers

  feature 'create project' do
    before :each do
      org_user_login
      @organization = Organization.create(name:"Fishy", website_url:"www.google.com", description:"I like saving fish")
    end
    scenario 'a user can click the create projects button' do
      visit(organization_path(@organization))
      expect(page).to have_button('New Project')
    end

    scenario 'a user can enter and submit project' do
      visit(new_project_path)
      fill_in 'Title', :with => 'Toolshed'
      fill_in 'Vision', :with => 'Share Knowledge'
      fill_in 'Need', :with => 'People'
      fill_in 'Description', :with => 'We are looking for someone to create a lesson and resource-sharing website'
      fill_in 'Benefit', :with => 'Educated People'
      fill_in 'Contact name', :with => 'Kim'
      fill_in 'Contact email', :with => 'dude@dude.com'
      fill_in 'Contact phone', :with => '555-555-5555'
      fill_in 'Deadline', :with => '12-21-2016'
      click_button 'Save Project'
      expect(page).to have_content('Project Proposal')
    end
  end
  feature 'edit project' do
    before :each do
      org_user_login
      @organization = Organization.create(name:"Fishy", website_url:"www.google.com", description:"I like saving fish")
    end
    scenario 'a user can click the edit projects button' do
      visit(new_project_path)
      fill_in 'Title', :with => 'Toolshed'
      fill_in 'Vision', :with => 'Share Knowledge'
      fill_in 'Need', :with => 'People'
      fill_in 'Description', :with => 'We are looking for someone to create a lesson and resource-sharing website'
      fill_in 'Benefit', :with => 'Educated People'
      fill_in 'Contact name', :with => 'Kim'
      fill_in 'Contact email', :with => 'dude@dude.com'
      fill_in 'Contact phone', :with => '555-555-5555'
      fill_in 'Deadline', :with => '12-21-2016'
      sleep(2)
      click_button 'Save Project'
      click_button 'Update Project'
      expect(page).to have_button("Commit Changes")
    end
  end
end
