module LoginHelpers

  def user_login
    User.create!(first_name: 'New', last_name: 'Person', email: 'user@user.com', password: 'password')
    visit '/users/sign_in'
    within(".new_user") do
      fill_in 'Email', :with => 'user@user.com'
      fill_in 'Password', :with => 'password'
    end
    click_button 'Log in'

  end

end
