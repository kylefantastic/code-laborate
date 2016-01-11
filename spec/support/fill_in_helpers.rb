module FillInHelpers

  def new_org
    visit(new_organization_path)
    fill_in 'Organization Name', :with => 'Rooted in Community'
    fill_in 'Website', :with => 'www.rootedincommunity.org'
    fill_in 'Description', :with => 'cool@user.com'
    click_button 'Save Organization'
  end

  def add_project
    visit(new_project_path)
    fill_in 'Project Title', :with => 'Toolshed'
    fill_in 'Vision', :with => 'Share Knowledge'
    fill_in 'Need', :with => 'People'
    fill_in 'Description', :with => 'We are looking for someone to create a lesson and resource-sharing website'
    fill_in 'Benefit', :with => 'Educated People'
    fill_in 'Contact name', :with => 'Kim'
    fill_in 'Contact email', :with => 'dude@dude.com'
    fill_in 'Contact phone', :with => '555-555-5555'
    fill_in 'Deadline', :with => '12-21-2016'
    click_button 'Save Project'
  end

  def add_second_project
    visit(new_project_path)
    fill_in 'Project Title', :with => 'Selfie-Distributor'
    fill_in 'Vision', :with => 'Share Beauty'
    fill_in 'Need', :with => 'Attention'
    fill_in 'Description', :with => 'We are looking for someone to look at me'
    fill_in 'Benefit', :with => 'Those with eyes'
    fill_in 'Contact name', :with => 'Narcissus'
    fill_in 'Contact email', :with => 'beauty@ful.com'
    fill_in 'Contact phone', :with => '555-555-5551'
    fill_in 'Deadline', :with => '12-25-2016'
    click_button 'Save Project'
  end

end
