class OrganizationsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user, only: [:new, :show, :update, :destroy]

  def new
    @organization = Organization.new
  end

  def create
    @user= User.find_by(id:current_user.id)
    @organization = Organization.new(org_params)
    if @organization.save
        @user.update!(organization_id:@organization.id)
        redirect_to organization_path(@organization)
    else
      render 'new'
    end
  end

  def show
    @organization = Organization.find(params[:id])
    render 'show'
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

    def authorize_user
      @user = User.find_by(id:current_user.id)
      unless @user.id == current_user.id
        redirect_to root_path
      end
    end
end
