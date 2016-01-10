class UsersController < ApplicationController

  def show
    @user = current_user
  end

  def delete

  end

  def update
    @user = current_user
  end
end
