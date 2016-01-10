class OrganizationsController < ApplicationController
  def new

  end

  def create
    p params
    @organization = Organization.new(org_params)
    p @organization
    if @organization.save
      render 'show'
    else
      @errors = @organization.errors.messages
      render 'new'
    end
  end

  def show
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
