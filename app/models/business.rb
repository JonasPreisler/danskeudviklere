class Business < ApplicationRecord
  belongs_to :account
  validates_presence_of   :name
  validate                :owner_can_only_have_one_business
  # validates_presence_of :first_name, :last_name, :title, :about, :city, :search_status
  extend FriendlyId
  friendly_id :name, use: :slugged
  mount_uploader :logo, LogoUploader


  private
  
  def owner_can_only_have_one_business
    if Business.where(account: account).size == 1
      errors.add('Account', 'can only own one business')
    end
  end

end
