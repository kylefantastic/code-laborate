class UsersController < ApplicationController
  layout false, only: [:show]
  def show
    @user = current_user
  end

  def destroy
    @user = current_user
    @user.destroy
    redirect_to root_path
  end

  def edit
    @user = current_user
    render template: "users/_edit_developer_div", layout: false
  end

  def update
    @user = current_user
    @user.update(user_params)
    render template: "users/_developer_profile", layout: false
    # return partial for developer-profile
    #add if statement for errors
  end

  def user_params
    user_permitted = %i(
      first_name
      last_name
      email
      public_profile_url
      bootcamp
    )
    params.require(:user).permit(user_permitted)
  end
end
