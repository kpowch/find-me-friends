class MessagesController < ApplicationController
  # create a new message
  def create
    message = Message.new(message_params)
    message.user = current_user
    if message.save
      # 'messages' is name of channel we are broadcasting to
      ActionCable.server.broadcast 'messages',
        # Set message and user
        message: message.content,
        user: message.user.first_name
      head :ok
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :chatroom_id)
  end
end
