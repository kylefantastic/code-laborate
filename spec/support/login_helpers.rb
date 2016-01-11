module LoginHelpers

  def user_login
    User.create(first_name: 'New',
                last_name: 'Person',
                email: 'user@user.com',
                public_profile_url: 'public.com',
                bootcamp: 'DBC',
                password: 'password')
    visit '/users/sign_in'
    within(".new_user") do
      fill_in 'Email', :with => 'user@user.com'
      fill_in 'Password', :with => 'password'
    end
    click_button 'Log in'
  end

  def org_user_login
    user_org = User.create(first_name: 'New',
                last_name: 'Person',
                email: 'person@user.com',
                password: 'password',
                org_affiliate: true, organization_id: 1)
    visit '/users/sign_in'
    within(".new_user") do
      fill_in 'Email', :with => 'person@user.com'
      fill_in 'Password', :with => 'password'
    end
    click_button 'Log in'
  end

  def add_project
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
  end


end
