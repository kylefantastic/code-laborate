class BookmarksController < ApplicationController
  def create
    project_id = params[:bookmark][:project_id].to_i
    developer_id = params[:bookmark][:developer_id].to_i
    bookmark_data = {project_id: project_id, developer_id: developer_id}
    @project = Project.find(project_id)
    @bookmark = Bookmark.create(bookmark_data)
    render "bookmarks/_bookmark_selected", locals: {project: @project, bookmark: @bookmark}, :layout => false
  end

  def destroy
    p params
    project_id = params[:bookmark][:project_id].to_i
    developer_id = params[:bookmark][:developer_id].to_i
    @bookmark = Bookmark.find_by(project_id: project_id, developer_id: developer_id)
    @project = Project.find(project_id)
    @bookmark.destroy
    render "bookmarks/_unbookmark", locals: {project: @project}, :layout => false
  end

end
