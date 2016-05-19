class ConversationsController < ApplicationController

  def index
    @conversations = current_user.mailbox.conversations

  end

  def show
    @conversation = current_user.mailbox.conversations.find(params[:id])
  end

  def new
    @recipients = User.all - [current_user]
  end

  def create
    recipient = User.find(params[:user_id])
    @body = params[:body]
    receipt = current_user.send_message(recipient, @body, params[:subject])
    if (@body == "")
      alert = "Body cannot be empty"
    else
    redirect_to conversation_path(receipt.conversation)
    end
  end
end
