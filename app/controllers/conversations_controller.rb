class ConversationsController < ApplicationController
  before_action :authenticate_account!
  before_action :set_developer, only: %i[new create]

  def show
    @conversation = current_account.conversations.friendly.find(params[:id])
    @message = current_account.messages.build
  end

  def new
    @conversation = Conversation.new
    @conversation.messages.build
  end


  def create
    @conversation = Conversation.new(conversation_params)
    @conversation.participant_ids = [current_account.id, @developer.account_id]

    respond_to do |format|
      if @conversation.save
        format.html { redirect_to conversation_path(@conversation) }
      else
        p @conversation.errors.full_messages
        format.html
      end
    end
  end


  private

    def set_developer
      @developer = Developer.friendly.find(params[:developer])
    end

    def conversation_params
      params.require(:conversation).permit(messages_attributes: [:content, :account_id])
    end
end
