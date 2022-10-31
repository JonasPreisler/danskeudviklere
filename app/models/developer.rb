class Developer < ApplicationRecord
  belongs_to :account
  has_many :projects
  has_many :developers_languages
  has_many :languages, through: :developers_languages
  has_many :tools, through: :projects
  validates_presence_of :first_name, :last_name, :title, :about, :role_types, :search_status

  enum search_status: [:is_active, :unavailable, :invisible]

  mount_uploader :profile_picture, ProfilePictureUploader

  extend FriendlyId
  friendly_id :name, use: :slugged

  def name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def language_names
    languages.pluck(:name).join(', ')
  end
end
