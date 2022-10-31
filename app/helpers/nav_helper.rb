module NavHelper

  def dev_path(account)
    account.developer ? developer_path(current_account.developer) : new_developer_path(ref: 'intro')
  end
  def bus_path(account)
    account.business ? business_path(current_account.business) : new_business_path(ref: 'intro')
  end
end