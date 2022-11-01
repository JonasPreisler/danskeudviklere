module HtmlHelper

  def search_status_color_class(developer)
    developer.is_active? ? 'tx-primary' : 'opacity-25'
  end
end