class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new

  end

  def create
    render plain: params[:project]
    @project = Project.new(project_params)
    p project_params
    if @project.save
      p "Printing saved Project"
      p @project
        redirect_to project_path(@project)
    else
      p "Errors should be here"
      @errors = @project.errors
      redirect_to new_project_path
    end
  end

  def show
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
      )
      params.require(:project).permit(project_permitted)
    end

end
