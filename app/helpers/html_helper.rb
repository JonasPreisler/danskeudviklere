module HtmlHelper

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
  
end