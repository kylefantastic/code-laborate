require 'rails_helper'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

xdescribe 'Bookmark feature testing:', :type => :feature, js: true do
  include LoginHelpers
  include FillInHelpers

  feature 'Bookmark' do

      before :each do
        user_login
        Project.create(title: 'Toolshed',
          vision: 'Share knowledge',
          need: "People",
          description: 'We are looking for someone to create a lesson and resource-sharing website',
          benefit: "Educate youth",
          contact_name: "Tamaya",
          contact_email: "Jones",
          contact_phone: "555-555-5555",
          deadline: '12-21-2016')
      end

      scenario 'the user can mark a project with a bookmark' do
        pending
        visit(projects_path)
        click_link ('#project1')
        expect()
      end

      scenario 'the user can remove a bookmark' do
        pending
        visit(projects_path)
      end


  end
end
