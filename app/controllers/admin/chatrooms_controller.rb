class Admin::ChatroomsController < AdminController

  def index
    @chatrooms = Chatroom.order(id: :desc).all
  end

  def new
    @chatroom = Chatroom.new
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)

    if @chatroom.save
      redirect_to [:admin, :chatrooms], notice: 'Chatroom created!'
    else
      redirect_to [:admin, :chatrooms], notice: 'There was an error creating the chatroom.'
    end
  end

  def destroy
    @chatroom = Chatroom.find params[:id]
    @chatroom.destroy
    redirect_to [:admin, :chatrooms], notice: "Chatroom deleted successfully."
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:friendship_id)
  end
end
