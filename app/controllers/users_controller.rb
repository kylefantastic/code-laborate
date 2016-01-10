class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def delete

  end

  def edit

  end
end
