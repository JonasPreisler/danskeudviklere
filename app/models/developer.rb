class Developer < ApplicationRecord
  belongs_to :account
  has_many :projects
  has_many :developers_languages
  has_many :languages, through: :developers_languages
  has_many :tools, through: :projects
  validates_presence_of :first_name, :last_name, :title, :about, :role_types, :search_types

  mount_uploader :profile_picture, ProfilePictureUploader

  def name
    "#{first_name} #{last_name}"
  end

  def language_names
    languages.pluck(:name).join(', ')
  end
end
