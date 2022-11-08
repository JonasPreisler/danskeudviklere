module ConversationsHelper

  def can_send_message?(developer)
    current_account.business.present? &&
    !(current_account.developer.present? &&
      current_account.developer == developer)
  end

  def chat_mate(conversation)
    conversation.accounts.where.not(id: current_account.id).first
  end

  def chat_mate_name(conversation)
    relation(conversation).name
  end

  def chat_mate_title(conversation)
    relation(conversation).class.name == 'Developer' ? relation(conversation).title : ''
  end

  def relation(conversation)
    chat_mate = chat_mate(conversation)
    if conversation.business.account != current_account
      chat_mate.business
    else
      chat_mate.developer
    end
  end

  # def read_status(message, account)
  #   if message.account == account &&
  #       !message.read
  #       sanitize('<div class="text-light-gray tx-13">Ulæst</div>')
  #   end
  # end

end