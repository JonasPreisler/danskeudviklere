class MessagesController < ApplicationController
  before_action :authenticate_account!

  def create
    @message = current_account.messages.build(message_params)
    @message.conversation = Conversation.friendly.find(params[:conversation_id])

    respond_to do |format|
      if @message.save
        format.turbo_stream do
          render turbo_stream: turbo_stream.append(:messages, partial: "conversations/messages/show",
          locals: { message: @message })
        end
      else
        p @message.errors.full_messages
        format.js
      end
    end
  end

  private

    def message_params
      params.require(:message).permit(:content, :conversation_id)
    end
end
