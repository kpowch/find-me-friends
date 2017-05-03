class ChatroomsController < ApplicationController
  # redirect users who are not logged in
  before_action :require_login

  # set cookie (current user's name) so chat can differentiate between sender/receiver
  before_action :set_user

  # shows all chatrooms that belong to current user
  def index
    @user_chats = Chatroom.where(friendship_id: friendship_chats)
    @messages = Message.where(chatroom_id: @user_chats)
  end

  # shows individual chatroom
  def show
    # all chatrooms a user belongs to
    @user_chats = Chatroom.where(friendship_id: friendship_chats)
    # all the messages in the chatrooms they belong to
    @messages = Message.where(chatroom_id: @user_chats)
    # chatroom their on
    @chatroom = Chatroom.find_by(id: params[:id])
    # to create a new message
    @message = Message.new
  end

  # creates a chatroom given a friendship_id
  def create
    @chatroom = Chatroom.create(chatroom_params)
    puts "\n\n\n chatroom is #{@chatroom.inspect}"

    # create notifications to alert users of a new chatroom
    friendship = Friendship.find(@chatroom.friendship_id)
    puts "\n\n #{friendship.inspect}"
    Notification.create({
      content: "New friendship created with #{friendship.user.first_name} #{friendship.user.last_name}!",
      user: friendship.friend,
      chatroom_id: @chatroom.id
    })

    Notification.create({
      content: "New friendship created with #{friendship.friend.first_name} #{friendship.friend.last_name}!",
      user: friendship.user,
      chatroom_id: @chatroom.id
    })
    puts "Here are the notifications #{Notification.all.inspect}"

    respond_to do |format|
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
      format.html { redirect_to chatrooms_url, notice: 'Friendship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:friendship_id)
  end

  def set_user
    cookies[:first_name] = current_user.first_name || 'first_name=guest'
  end

  def friendship_chats
    chats1 = Friendship.where(user_id: current_user.id, friendship_status: 'accepted')
    chats2 = Friendship.where(friend_id: current_user.id, friendship_status: 'accepted')
    return chats1 + chats2
  end
end
