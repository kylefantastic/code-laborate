require 'rails_helper'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end


describe 'Project feature testing:', :type => :feature, js: true do
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
      add_project
      expect(page).to have_content('Project Proposal')
    end
  end
  feature 'edit project' do
    before :each do
      org_user_login
      @organization = Organization.create(name:"Fishy", website_url:"www.google.com", description:"I like saving fish")
    end
    scenario 'a user can delete a project' do
      add_project
      click_button 'Delete Project'
      expect(page).to have_selector('li', count:0)
    end
    scenario 'a user can click the edit projects button' do
      pending
      add_project
      click_button 'Update Project'
      expect(page).to have_button("Commit Changes")
    end
  end
end
