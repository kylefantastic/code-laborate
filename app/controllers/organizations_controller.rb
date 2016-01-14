class OrganizationsController < ApplicationController
  # before_action :authenticate_user!
  before_action :authorize_user, only: [:new, :show, :update, :destroy]
  layout false, only: [:show,:update]
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
      render :new
    end
  end
  def show
    @organization = Organization.find(params[:id])
    render 'show'
  end

  def edit
    @organization = Organization.find(current_user.organization_id)
    p @organization
    render template: "organizations/_edit_organization", layout: false
  end

  def update
    @organization = Organization.find(current_user.organization_id)
    @organization.update(org_params)
    render template: "organizations/_display_organization", layout: false
  end

  def destroy
    @user = User.find(current_user.id)
    @organization = Organization.find(@user.organization_id)
    @organization.destroy
    @user.destroy
    redirect_to root_path
  end

  private
    def org_params
      org_permitted = %i(name description website_url logo)
      params.require(:organization).permit(org_permitted)
    end

    def authorize_user
      @user = User.find_by(id:current_user.id)
      unless @user.id == current_user.id
        redirect_to root_path
      end
    end
end
