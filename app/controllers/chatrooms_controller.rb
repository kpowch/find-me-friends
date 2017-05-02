class ChatroomsController < ApplicationController
  # redirect users who are not logged in
  before_action :require_login

  # set cookie (current user's name) so chat can differentiate between sender/receiver
  before_action :set_user

  # TODO this should move to admin
  # shows all the chatrooms and it's members, and buttons to create or delete them
  def index
    @chatrooms = Chatroom.all
    @friendship_chat = friendship_chats
    @user_chats = Chatroom.where(friendship_id: @friendship_chat)
    @messages = Message.where(chatroom_id: @user_chats)
  end

 def show
    @friendship_chat = friendship_chats
    @user_chats = Chatroom.where(friendship_id: friendship_chats)
    @messages = Message.where(chatroom_id: @user_chats)
    @chatroom = Chatroom.find_by(id: params[:id])
    @message = Message.new
  end

  # TODO do we need this if there is no form? or is it required if you have create?
  def new
  end

  # creates a chatroom given a friendship_id
  def create
    @chatroom = Chatroom.new(chatroom_params)
    # TODO We probably shouldn't redirect to any page once a chatroom is made since it's
    # made once a friendship status changes and the user might be on a different page.
    respond_to do |format|
      puts 'format'
      puts format.inspect
      format.json do
        if @chatroom.save
          flash[:alert] = "Chatroom created!"
          render :json => @chatroom
        else
          flash[:alert] = "There was an error creating the chatroom"
          render :json => { :errors => @chatroom.errors.messages}
        end
      end
    end
  end


  # deletes a chatroom
  def destroy
    @chatroom.destroy
    respond_to do |format|
      puts 'format'
      puts format
      format.html { redirect_to chatrooms_url, notice: 'Friendship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def chatroom_params
    puts 'params'
    puts params.inspect
    params.permit(:friendship_id)
  end

  def set_user
    cookies[:first_name] = current_user.first_name || 'first_name=guest'
  end

  def friendship_chats
    chats1 = Friendship.where('user_id = ? AND friendship_status = ?', current_user.id, 'accepted')
    chats2 = Friendship.where('friend_id = ? AND friendship_status = ?', current_user.id, 'accepted')
    return chats1 + chats2
  end
end
