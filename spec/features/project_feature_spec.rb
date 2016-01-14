require 'rails_helper'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end


describe 'Project feature testing:', :type => :feature, js: true do
  include LoginHelpers
  include FillInHelpers

  feature 'create project' do
    before :each do
      seed_categories
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

    scenario "if a user doesn't fill out all forms it will show 8 error messages" do
      visit(new_project_path)
      click_button 'Save Project'
      sleep(60)
      expect(page).to have_content("8 errors prohibited this project from being saved:")
    end

    scenario 'if a user only fills out Project Title 7 error messages show' do
      visit(new_project_path)
      fill_in 'Project Title', :with => 'Toolshed'
      click_button 'Save Project'
      expect(page).to have_content("7 errors prohibited this project from being saved:")
    end
  end

  feature 'edit project' do
    before :each do
      seed_categories
      org_user_login
      @organization = Organization.create(name:"Fishy", website_url:"www.google.com", description:"I like saving fish")
    end

    scenario 'a user can delete a project' do
      add_project
      click_button("Delete Project")
      expect(Project.all.count).to be(0)
    end

    scenario 'a user can click the edit projects button' do
      pending
      add_project
      click_button 'Update Project'
      expect(page).to have_button("Commit Changes")
    end
  end
end
