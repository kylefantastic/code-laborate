class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def create
    p params
    @project = Project.new(project_params)
    p @project
    if @project.save
      if @project
        redirect_to projects_path
      else
        redirect_to projects
      end
    else
      @errors = @project.errors
      redirect_to new_project_registration_path
    end
  end

  def project_params
      project_permitted = %i(
        title
        description
        contact_name
        contact_email
        contact_phone
        deadline

      )
      params.require(:project).permit(project_permitted)
    end

end
