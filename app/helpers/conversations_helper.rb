module ConversationsHelper

  def chat_mate(conversation)
    conversation.accounts.where.not(id: current_account.id).first
  end

  def chat_mate_name(conversation)
    relation(conversation).name
  end

  def chat_mate_title(conversation)
    relation(conversation).title || ''
  end


  def relation(conversation)
    chat_mate = chat_mate(conversation)
    if conversation.business.account != current_account
      chat_mate.business
    else
      chat_mate.developer
    end
  end

end