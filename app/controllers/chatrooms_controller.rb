class ChatroomsController < ApplicationController

  def index
    @chatroom = Chatroom.find_by(id: params[:id])
    @message = Message.new
  end

  def show
    @chatroom = Chatroom.find_by(id: params[:id])
    @message = Message.new
  end
end

