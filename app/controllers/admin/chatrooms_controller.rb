class Admin::ChatroomsController < AdminController

  def index
    @chatrooms = Chatroom.all
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:friendship_id)
  end
end
