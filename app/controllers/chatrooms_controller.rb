class ChatroomsController < ApplicationController
  # redirect users who are not logged in
  before_action :require_login

  # set cookie (current user's name) so chat can differentiate between sender/receiver
  before_action :set_user

  # TODO this should move to admin
  # shows all the chatrooms and it's members, and buttons to create or delete them
  def index
    @chatrooms = Chatroom.all
  end

  # TODO do we need this if there is no form? or is it required if you have create?
  def new
  end

  # creates a chatroom given a friendship_id
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

  # TODO make this more efficient? Might have to rearrange models/database
  # shows individual chatrooms
  def show
    # for section showing all of the user's convos
    @userChatrooms = Chatroom.joins(:users).where(friendships: { user: 2 })
    @friendChatrooms = Chatroom.joins(:users).where(friendships: { friend: 2 })

    # for the specific chatroom and messages
    @chatroom = Chatroom.find_by(id: params[:id])
    @message = Message.new
  end

  # deletes a chatroom
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
