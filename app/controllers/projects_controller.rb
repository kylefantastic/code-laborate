class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
        redirect_to project_path(@project)
    else
      p @project
      render 'new'
    end
  end

  def show
    @project = Project.find(params[:id])
    @organization = Organization.find(@project.organization_id)
  end

  def edit
    @project = Project(project_params)
  end

  def update
    @project = Project.find(params[:id])
    if @project = Project.update(project_params)
      render template: "projects/_edit_form"
    else

    end
  end

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
