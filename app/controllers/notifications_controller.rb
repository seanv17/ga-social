class NotificationsController < ApplicationController
  def index
    @notifications = Notification.all
  end

  def link_through
    @notification = Notification.find(params[:id])
    @notification.update read: true
    redirect_to post_path @notification.post
  end


end
