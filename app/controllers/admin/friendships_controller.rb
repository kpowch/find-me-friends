class Admin::FriendshipsController < AdminController

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
