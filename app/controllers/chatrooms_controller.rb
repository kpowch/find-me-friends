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
end
