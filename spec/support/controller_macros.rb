module ControllerMacros

  def login_business_account
    before(:each) do
      # @request.env['devise.mapping'] = Devise.mappings[:account]
      @business_account = FactoryBot.create(:account, :business)
      login_as @business_account
      Capybara.session_name = 'business_session'
    end
  end

  def login_developer_account
    before(:each) do
      # @request.env['devise.mapping'] = Devise.mappings[:account]
      @developer_account = FactoryBot.create(:account, :developer)
      login_as @developer_account
      Capybara.session_name = 'developer_session'
    end
  end

  def create_developer
    before(:each) do
      @dev_account_1 = FactoryBot.create(:account, :developer)
    end
  end
end