class ApplicationController < ActionController::Base
  before_action :set_current_developer, :set_current_business, if: proc {account_signed_in?}
  before_action :set_referrer
  helper Turbo::FramesHelper if Rails.env.test?
  helper Turbo::StreamsHelper if Rails.env.test?


  private

  def set_current_developer
    if account_signed_in? && current_account.developer
      @current_developer = current_account.developer
    end
  end
  def set_current_business
    if account_signed_in? && current_account.business
      @current_business = current_account.business
    end
  end

  def set_referrer
    @referrer = params[:ref] || ''
  end

end
