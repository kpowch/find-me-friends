class Admin::FriendshipsController < ApplicationController
  http_basic_authenticate_with name: 'admin', password: 'admin'

  def index
    @chatrooms = Chatroom.all
  end

  def new
  end

  def update
  end

  def destroy
  end

end
