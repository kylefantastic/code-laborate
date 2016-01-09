class Users::RegistrationsController < Devise::RegistrationsController
    def index
    end

    def create
      p params
      @user = User.new(user_params)
      p @user
      if @user.save
        if @user.org_affiliate
            redirect_to new_organization_path
        else
          redirect_to projects_path
        end
      else
        @errors = @user.errors
        redirect_to new_user_registration_path
      end
    end

    def user_params
      user_permitted = %i(
        first_name
        last_name
        email
        password
        org_affiliate
        password_confirmation
      )
      params.require(:user).permit(user_permitted)
    end
end
