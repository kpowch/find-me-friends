class ChatroomsController < ApplicationController

  def index
    @chatroom = Chatroom.find_by(id: params[:id])
    @chatroom_props = {name: 'Paige', messages: ['hello', 'how are you'], friendships: ['Ksenia', 'Paige', 'Wyatt']}
  end
end

