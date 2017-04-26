class ChatroomsController < ApplicationController

  def new
    # TODO i don't know what this does
    # if request.referrer.split('/').last == 'chatrooms'
    #   flash[:notice] = nil
    # end
    @chatroom = Chatroom.new
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)

    # TODO i don't know what this does
    # if @chatroom.save
    #   respond_to do |format|
    #     format.html { redirect_to @chatroom }
    #     format.js
    #   end
    # else
    #   respond_to do |format|
    #     flash[:notice] = {error: ["a chatroom with this topic already exists"]}
    #     format.html { redirect_to new_chatroom_path }
    #     format.js { render template: 'chatrooms/chatroom_error.js.erb'}
    #   end
    # end
  end

  def show
    @chatroom = Chatroom.find_by(id: params[:id])
    @messages = Message.where(chatroom_id: params[:id])
    @friendships = Friendship.where(user_id: current_user.id)
    @message = Message.new
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:topic)
  end
end
