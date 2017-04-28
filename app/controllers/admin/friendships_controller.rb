class Admin::FriendshipsController < ApplicationController

  http_basic_authenticate_with name: 'tellmewhatyouwant', password: 'whatyoureallyreallywant'

  def show
  end

  def new
  end

  def update
  end

  def destroy
  end

end
