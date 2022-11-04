module ControllerMacros

  def login_business_account
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:account]
      account = FactoryBot.create(:account, :business)
      login_as account
    end
  end
  def login_account
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:account]
      account = FactoryBot.create(:account)
      login_as account
    end
  end
end