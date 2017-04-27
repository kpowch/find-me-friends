class ChatroomsController < ApplicationController

  # TODO this should move to admin
  def index
    @chatrooms = Chatroom.all
  end

  def new
    # TODO i don't know what this does
    # if request.referrer.split('/').last == 'chatrooms'
    #   flash[:notice] = nil
    # end
    # @chatroom = Chatroom.new
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    # TODO We probably shouldn't redirect to any page once a chatroom is made
    # since it's made once a friendship status changes and the user might
    # be on a different page.
    if @chatroom.save
      redirect_to @chatroom
    else
      flash[:notice] = "There was an error creating the chatroom"
      redirect_to new_chatroom_path
    end
  end

  def show
    # For the sidebar of all user's convos
    @friendships = Friendship.where(user_id: current_user.id)
    @userChatrooms = Chatroom.includes(@friendships)

    # For the specific chatroom and messages
    @chatroom = Chatroom.find_by(id: params[:id])
    @messages = Message.where(chatroom_id: params[:id])
    @message = Message.new
  end

  # TODO this should move to admin
  def destroy
    @chatroom = Chatroom.find params[:id]
    @chatroom.destroy
    redirect_to [:chatrooms], notice: 'Chatroom deleted!'
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(
     :friendship_id
    )
  end
end
