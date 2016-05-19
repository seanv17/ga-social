class MessagesController < ApplicationController
  before_action :set_conversation

  def create
    @body = params[:body]
    receipt = current_user.reply_to_conversation(@conversation, @body)
    if (@body.empty?)
      alert = "body cannot be empty"
      render :action => :show
    else
    redirect_to conversation_path(receipt.conversation)
  end
  end

  private

  def set_conversation
    @conversation = current_user.mailbox.conversations.find(params[:conversation_id])
  end
end
