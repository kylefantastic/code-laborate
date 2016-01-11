class UsersController < ApplicationController

  def show
    @user = current_user
  end

  def delete

  end

  def edit
    @user = current_user
    render template: "users/_edit_developer_div"
  end

  def update
    @user = current_user
    @user.update(user_params)
    p "Update success"
    render template: "users/_developer_profile"
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
