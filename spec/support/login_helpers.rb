module LoginHelpers

  def user_login
    User.create(:email => 'user@user.com', :password => 'password')
    visit '/users/sign_in'
    within(".new_user") do
      fill_in 'first_name', :with => 'Platypus'
      fill_in 'last_name', :with =>'Maximus'
      fill_in 'Email', :with => 'user@user.com'
      fill_in 'Password', :with => 'password'
    end
    click_button 'Log in'
    click_button 'Home'
  end

end
