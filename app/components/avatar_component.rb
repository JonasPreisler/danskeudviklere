class AvatarComponent

  DEFAULT_AVATAR = '/images/avatar.png'

  def initialize(account)
    @account = account
  end

  def image
    if @account.developer && @account.developer.profile_picture.present?
      @account.developer.profile_picture
    elsif @account.business && @account.business.logo.present?
      @account.business.logo
    end
  end

  def image_40px
    image ? image.url(:size_40px) : DEFAULT_AVATAR
  end
  def image_100px
    image ? image.url(:size_100px) : DEFAULT_AVATAR
  end
end