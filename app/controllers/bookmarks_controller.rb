class BookmarksController < ApplicationController
  def create
    p "*" * 80
    p params
    project_id = params[:bookmark][:project_id].to_i
    developer_id = params[:bookmark][:developer_id].to_i
    bookmark_data = {project_id: project_id, developer_id: developer_id}

    @project = Project.find(project_id)
    @bookmark = Bookmark.create(bookmark_data)
    render "bookmarks/_bookmark_selected", locals: {project: @project, bookmark: @bookmark}, :layout => false
  end

  # def destroy
  #   @bookmark = Bookmark.find(params[:id])
  #   @project = Project.find(@bookmark.developer_id)
  #   @bookmark.destroy
  #   debugger
  #   render "bookmarks/_unbookmark", locals: {project: @project}, :layout => false
  # end

end
