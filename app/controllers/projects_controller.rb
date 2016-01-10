class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new

  end

  def create
    p params
    @project = Project.new(project_params)
    if @project.save
        redirect_to project_path(@project)
    else
      @errors = @project.errors.full_messages
      redirect_to new_project_path
    end
  end

  def show
    @project = Project.find(params[:id])
    @organization = Organization.find(@project.organization_id)
    p @project
    p @organization
  end
  # def edit
  #   @project = Project.find(params[:id])
  # end
  # def update
  #   p "I got here"
  #   p params
  #   @project = Project.find(params[:id])
  # end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    @organization = Organization.find(@project.organization_id)
    redirect_to organization_path(@organization)
  end

  def project_params
      project_permitted = %i(
        title
        vision
        need
        description
        benefit
        contact_name
        contact_email
        contact_phone
        deadline
        organization_id
      )
      params.require(:project).permit(project_permitted)
    end

end
