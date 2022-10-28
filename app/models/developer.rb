class Developer < ApplicationRecord
  belongs_to :account
  has_many :experiences
  has_many :programming_languages, through: :experiences

  mount_uploader :profile_picture, ProfilePictureUploader

  def name
    "#{first_name} #{last_name}"
  end

  def programming_language_names
    programming_languages.pluck(:name).join(', ')
  end
end
