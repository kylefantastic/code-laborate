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



end
