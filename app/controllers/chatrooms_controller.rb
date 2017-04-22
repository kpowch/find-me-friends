class ChatroomsController < ApplicationController

  def index
    @chatroom = Chatroom.find_by(slug: params[:slug])
    @message = Message.new
  end


  def show
    @chatroom = Chatroom.find_by(slug: params[:slug])
    @message = Message.new
  end
end

