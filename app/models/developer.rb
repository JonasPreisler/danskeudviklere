class Developer < ApplicationRecord
  belongs_to :account
  has_many :projects
  has_many :tools, through: :projects
  validates_presence_of :first_name, :last_name, :title, :about, :city, :search_status

  enum search_status: [:is_active, :unavailable, :invisible]

  mount_uploader :profile_picture, ProfilePictureUploader

  scope :visible, -> { where.not(search_status: 'invisible') }

  extend FriendlyId
  friendly_id :name, use: :slugged

  def name
    first_name.present? ? "#{first_name.capitalize} #{last_name.capitalize}" : ''
  end

  ##################### FOR SEARCH #####################

  scope :programming_languages, -> (programming_languages) { where("'#{programming_languages}' = ANY (programming_languages)") }
  scope :city, -> (city) { where(city: city) }

  def self.filter(filter_params)
    results = where(nil)
    filter_params.each do |key, value|
      results = results.public_send(key, value) if value.present?
    end
    results
  end
  
  ##################### END OF FOR SEARCH #####################

end
