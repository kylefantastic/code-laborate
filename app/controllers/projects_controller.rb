class ProjectsController < ApplicationController
  layout false, only: [:index]
  def index
    @project = Project.new #Do we need this?
    @projects = Project.all
    @organizations = Organization.all
    # debugger
    if current_user && !current_user.org_affiliate
      seek
    end
  end

  def new
    @project = Project.new
    @categories = Category.all
  end

  def create
    @categories= Category.all
    @project = Project.new(project_params)
    if @project.save
      if params[:category]
        @project_category_names = params[:category].keys
        @project_category_names.each do |name|
          category = Category.find_by(name: name)
          @project.categories << category
        end
      end
      redirect_to project_path(@project)
    else
      render 'new'
    end
  end

  def show
    @project = Project.find(params[:id])
    @organization = Organization.find(@project.organization_id)
    @categories = @project.categories
  end

  def edit
    @project = Project.find(params[:id])
    @categories = Category.all
    render 'projects/_edit_form', :layout => false
  end

  def update
    @project = Project.find(params[:project][:id])
    @organization = Organization.find(@project.organization_id)
    @categories = @project.categories
    @user = current_user
    if @project.update(project_params)
      if @project.developer_id
        UserMailer.dev_project(@project,@user).deliver_later
        render template: "projects/_show_project", :layout => false
      else
        render template: "projects/_show_project", :layout => false
      end
    else
      p 'in else, need error'
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
        project_image
        organization_id
        developer_id
      )
      params.require(:project).permit(project_permitted)
    end

    def seek
      if params[:search]
        @projects = Project.search(params[:search]).order("created_at DESC")
        @organizations = Organization.search(params[:search]).order("created_at DESC")
        p "#O" * 20
        p @organizations
        p "O#" * 20
        render template: "projects/_search_results"
      else
        @projects = Project.order("created_at DESC")
      end
    end

end
