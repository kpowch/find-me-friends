class ChatroomsController < ApplicationController

  def index
    @chatroom = Chatroom.find_by(id: params[:id])
    @user = User.find_by(id: 1)
    @message = Message.new
    @chatroom_props = {name: "Oaige", messages: ['hello', 'how are you'], friendships: ['Ksenia', 'Paige', 'Wyatt']}
  end

  def show
    @chatroom = Chatroom.find_by(id: params[:id])
    @messages = Message.where(chatroom_id: params[:id])
    @user = User.find_by(id: 1)
    @message = Message.new
    @chatroom_props = {name: "Oaige", messages: ['hello', 'how are you'], friendships: ['Ksenia', 'Paige', 'Wyatt']}
  end

end

