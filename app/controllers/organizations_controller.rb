class OrganizationsController < ApplicationController
  def new

  end

  def show
    @organization = Organization.find(params[:id])
    render 'show'
  end
  def create
    p '%%%%%%%%%%%%%%%%%%%%%'
    p params
    p '%%%%%%%%%%%%%%%%%%%%%'
    @organization = Organization.new(org_params)

    if @organization.save
    p @organization
    p '****************'
      redirect_to organization_path(@organization)
      # render 'show'
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
