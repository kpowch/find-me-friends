class Admin::UsersController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_USER'], password: ENV['ADMIN_PASSWORD']

  def show
  end

  def new
  end

  def update
  end

  def destroy
  end

end
