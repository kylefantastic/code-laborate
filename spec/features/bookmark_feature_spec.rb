require 'rails_helper'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

describe 'Bookmark feature testing:', :type => :feature, js: true do
  include LoginHelpers
  include FillInHelpers
  

  feature 'Bookmark' do

    before :each do
      user_login
      Organization.create!(name: "Rooted in Community", 
        description: "cool@user.com", 
        website_url: "www.rootedincommunity.org")
  
      Project.create!(title: 'Toolshed',
        vision: 'Share knowledge',
        need: "People",
        description: 'We are looking for someone to create a lesson and resource-sharing website',
        benefit: "Educate youth",
        contact_name: "Tamaya",
        contact_email: "tamaya@example.com",
        contact_phone: "555-555-5555",
        deadline: '12-21-2016', organization_id: 1)
    end

    scenario 'the user can mark a project with a bookmark' do
      visit(projects_path)
      find('#project1').click
      expect(page).to have_css('i.fa-bookmark')
    end

    scenario 'the user can remove a bookmark' do
      visit(projects_path)
      find('#project1').click #marks bookmark
      find('#project1').click #unmarks bookmark
      expect(page).to have_css('i.fa-bookmark-o')
    end

    scenario 'the user can see list of bookmarks on their profile page' do
      visit(projects_path)
      find('#project1').click
      visit(user_path(1))
      expect(page).to have_content('Toolshed')
    end
  end
end
