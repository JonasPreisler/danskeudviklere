module HtmlHelper


  def role_types_color_class(developer, role)
    developer.role_types.include?(role) ? 'tx-primary' : 'opacity-25'
  end
  def fa_circle_class_for_role_types(developer, role)
    (developer.role_types && developer.role_types.include?(role)) ? 'fa-solid' : 'fa-regular'
  end

  def role_level_color_class(developer, level)
    developer.role_levels.include?(level) ? 'tx-primary' : 'opacity-25'
  end

  def fa_circle_class_for_role_level(developer, level)
    developer.role_levels.include?(level) ? 'fa-solid' : 'fa-regular'
  end

  def search_status_color_class(developer, status)
    developer.search_status == status ? 'tx-primary' : 'opacity-25'
  end
  
  def fa_circle_class_for_search_status(developer, status)
    developer.search_status == status ? 'fa-solid' : 'fa-regular'
  end

  def business_logo(business)
    business.logo.present? ? business.logo.url(:size_200px) : '/images/avatar.png'
  end

  def developer_pic(developer, size)
    if developer.profile_picture.present?
      if size == 200
        developer.profile_picture.url(:size_200px)
      else
        developer.profile_picture.url(:size_40px)
      end
    else
      '/images/avatar.png'
    end
    # developer.profile_picture.present? ? developer.profile_picture.url(:size_200px) : '/images/avatar.png'
  end

  def new_message_path(account, developer)
    if Conversation.exist?(account, developer)
      link_to sanitize("<i class='fa-regular fa-comment'></i> #{t('developers.show.open_conversation')}"), conversations_path("#{t('developers.show.conversation_param')}": @developer), class: 'btn btn-sm btn-outline-secondary'
    else
      link_to sanitize("<i class='fa-regular fa-comment'></i> #{t('developers.show.send_message')}"), new_conversation_path(developer: @developer), remote: true, class: 'btn btn-sm btn-outline-secondary'
    end
  end
  
end