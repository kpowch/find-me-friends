class NotificationsController < ApplicationController

  # create a new notification
  def create
    @notification = Notification.create(notification_params)
  end

  def destroy
    notification = Notification.find([params[:notification]])
    notification.destroy
  end

  private

  def notification_params
    params.require(:notification).permit(:content, :chatroom_id, :user_id)
  end
end
