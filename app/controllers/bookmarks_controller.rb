class BookmarksController < ApplicationController
  def create
    @project_id = params[:bookmark][:project_id].to_i
    @developer_id = params[:bookmark][:developer_id].to_i
    params = {project_id: @project_id, developer_id: @developer_id}

    @project = Project.find(@project_id)
    @bookmark = Bookmark.create(params)

    render partial: "bookmarks/_bookmark_selected", locals: {project: @project, bookmark: @bookmark}, :layout => false
  end

  # def destroy
  #   @bookmark = Bookmark.find(params[:id])
  #   @project = Project.find(@bookmark.developer_id)
  #   @bookmark.destroy
  #   render partial: "bookmarks/_unbookmark", locals: {project: @project}, :layout => false
  # end

end
