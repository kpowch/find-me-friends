class ChatroomsController < ApplicationController

  def index
    @chatroom = Chatroom.find_by(id: params[:id])
    @message = Message.new
    @chatrooms_props = { name: "Paige" }
  end
end

