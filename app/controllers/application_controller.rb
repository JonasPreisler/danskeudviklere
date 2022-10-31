class ApplicationController < ActionController::Base
  before_action :set_current_developer, :set_referrer



  private

  def set_current_developer
    if account_signed_in? && current_account.developer
      @current_developer = current_account.developer
    end
  end

  def set_referrer
    @referrer = params[:ref] || ''
  end
end
