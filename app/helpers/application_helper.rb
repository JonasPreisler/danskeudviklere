module ApplicationHelper
  def custom_bootstrap_flash
    flash_messages = []
    flash.each do |type, message|
      type = "notice" if type == "notice"
      type = "alert" if type == "alert"
      flash_notice =  '<div class="position-fixed bottom-0 end-0 p-3" style="z-index: 5000">'+
                        '<div class="toast fade" role="alert" aria-live="assertive" aria-atomic="true" data-bs-autohide="true">'+
                          '<div class="toast-body rounded">'+
                            message
                          '</div>'+
                        '</div>'+
                      '</div>'
      flash_messages << flash_notice.html_safe if message
    end
    flash_messages.join("\n").html_safe
  end

end
