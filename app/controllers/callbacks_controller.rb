class CallbacksController < Devise::OmniauthCallbacksController

    def facebook
      @user = User.from_omniauth(request.env["omniauth.auth"])
      sign_in @user, :event => :authentication
        if !(@user.organization_id)
          redirect_to new_organization_path
        else
          @organization = Organization.find(current_user.organization_id)
          redirect_to @organization
        end
    end
end
