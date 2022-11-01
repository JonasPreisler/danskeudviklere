class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :developer, dependent: :destroy
  has_one :business, dependent: :destroy


  def profile_pic_url
    if developer && developer.profile_picture.present?
      developer.profile_picture.url
    elsif business && business.logo.present?
      business.logo.url
    else
      '/images/avatar.png'
    end
  end
end
