class ConversationsController < ApplicationController
  before_action :authenticate_account!
  before_action :set_developer, only: %i[new create]
  before_action :set_conversation, :set_messages_to_read, only: :show

  def show
    @message = current_account.messages.build
  end

  def new
    @conversation = Conversation.new
    @conversation.messages.build
  end

  def index
    if current_account.conversations.any?
      redirect_to conversation_path(current_account.conversations.ordered_by_recent_first.first)
    end
  end


  def create
    @conversation = Conversation.new(conversation_params)
    @conversation.participant_ids = [current_account.id, @developer.account_id]
    @conversation.messages.first.account_id = current_account.id
    

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

    def set_conversation
      @conversation = current_account.conversations.friendly.find(params[:id])
    end

    def set_messages_to_read
      @conversation.set_messages_to_read(current_account)
    end

    def set_developer
      @developer = Developer.friendly.find(params[:developer])
    end

    def conversation_params
      params.require(:conversation).permit(messages_attributes: [:content, :account_id])
    end
end
