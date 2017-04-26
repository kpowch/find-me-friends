class ChatroomsController < ApplicationController

  def index

  end

  def show
    @chatroom = Chatroom.find_by(id: params[:id])
    @messages = Message.where(chatroom_id: params[:id])
    @message = Message.new

    # @chatroom_props = {name: current_user.first_name, messages: @messages}
  end

end

