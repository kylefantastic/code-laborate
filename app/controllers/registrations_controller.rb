class RegistrationsController < Devise::RegistrationsController

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
<<<<<<< HEAD
      UserMailer.welcome_email(@user).deliver_later
=======
>>>>>>> f3cf1d3647c009ca69fd18cd10132a92556a2e5f
      if @user.org_affiliate
        redirect_to new_organization_path
      else
        redirect_to projects_path
      end
    else
      p @errors = @user.errors.messages
      redirect_to new_user_registration_path
    end
  end

  private

  def user_params
    user_permitted = %i(
      first_name
      last_name
      email
      password
      org_affiliate
      password_confirmation
      public_profile_url
      bootcamp
    )
    params.require(:user).permit(user_permitted)
  end
end
