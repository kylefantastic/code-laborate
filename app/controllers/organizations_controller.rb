class OrganizationsController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def show
    @organization = Organization.find(params[:id])
    render 'show'
  end
  def create
    @user= User.find_by(id:current_user.id)
    @organization = Organization.new(org_params)
    if @organization.save
        @user.update!(organization_id:@organization.id)
        redirect_to organization_path(@organization)
    else
      @errors = @organization.errors.messages
      render 'new'
    end
  end


  def update
  end

  def destroy
  end

  private
  def org_params
      org_permitted = %i(name description website_url)
      params.require(:organization).permit(org_permitted)
    end
end
