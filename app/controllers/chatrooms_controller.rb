class ChatroomsController < ApplicationController
  # Set cookie (current user's name) so chat can differentiate between sender/receiver
  before_action :set_user

  # TODO this should move to admin
  # Shows all the chatrooms and it's members, and buttons to create or delete them
  def index
    @chatrooms = Chatroom.all
  end

  # TODO do we need this if there is no form? or is it required if you have create?
  def new
  end

  # Creates a chatroom given a friendship_id
  def create
    @chatroom = Chatroom.new(chatroom_params)
    # TODO We probably shouldn't redirect to any page once a chatroom is made since it's
    # made once a friendship status changes and the user might be on a different page.
    if @chatroom.save
      flash[:alert] = "Chatroom created!"
      redirect_to @chatroom
    else
      flash[:alert] = "There was an error creating the chatroom"
      redirect_to new_chatroom_path
    end
  end

  # TODO make this more efficient (how to get all user's chatrooms and do we need to pass
  # the messages? or can they be accessed through chatroom)
  # Shows individual chatrooms
  def show
    # For section showing all of the user's convos
    # @friendships = Friendship.where(user_id: current_user.id)
    # @userChatrooms = Chatroom.includes(@friendships)
    # @friends = Friendship.where(user_id: 2).or(Friendship.where(friend_id: 2))
    # @userChatrooms = Chatroom.includes(Friendship.includes("user.user_id = 2"))
    # For the specific chatroom and messages
    @chatroom = Chatroom.find_by(id: params[:id])
    @message = Message.new
  end

  # TODO this should move to admin
  # Deletes a chatroom
  def destroy
    @chatroom = Chatroom.find params[:id]
    @chatroom.destroy
    flash[:alert] = 'Chatroom deleted!'
    redirect_to [:chatrooms]
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:friendship_id)
  end

  def set_user
    cookies[:first_name] = current_user.first_name || 'first_name=guest'
  end
end
