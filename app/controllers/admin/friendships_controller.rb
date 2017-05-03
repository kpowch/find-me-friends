class Admin::FriendshipsController < AdminController

  def index
    @chatrooms = Chatroom.all
  end

end
