class Admin::ChatroomsController < ApplicationController
  http_basic_authenticate_with name: ['ADMI'], password: ENV['ADMIN_PASSWORD']
  def show
  end

  def index
    @chatrooms = Chatroom.all
  end

  def new
    @chatroom = Chatroom.new
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)

    if @chatroom.save
      redirect_to '/admin'
    else
      redirect_to '/admin'
    end
  end

  def destroy
    @chatroom = Chatroom.find params[:id]
    @chatroom.destroy
    redirect_to '/admin/chatrooms', notice: "Chatroom deleted successfully."
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:chatroom_id)
  end
end
