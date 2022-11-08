class Developer < ApplicationRecord

  ##################### ASSOCIATIONS #####################
  belongs_to :account
  has_many   :projects
  has_many   :tools, through: :projects

  ##################### VALIDATIONS #####################

  validates_presence_of :first_name, :last_name, :title, :about, :city, :search_status
  validates_length_of   :title, maximum: 60,
                        with_message: I18n.t('activerecord.models.validations.max_length_title')
  validates_length_of   :first_name, :last_name,
                        maximum: 22, with_message: I18n.t('activerecord.models.validations.max_length_name')
  # validates           :first_name, :last_name, length: { maximum: 22 }
  validate              :can_not_have_custom_city

  ##################### OTHER #####################

  paginates_per 5
  extend FriendlyId
  friendly_id :name, use: :slugged
  mount_uploader :profile_picture, ProfilePictureUploader
  enum search_status: [:is_active, :unavailable, :invisible]

  def name
    (first_name.present? && last_name.present?) ? "#{first_name.capitalize} #{last_name.capitalize}" : ''
  end

  ##################### SCOPES #####################

  scope :visible, -> { where.not(search_status: 'invisible') }

  ##################### SEARCH #####################

  scope :programming_languages, -> (programming_languages) {
                                      where("'#{programming_languages}' = ANY (programming_languages)")}
  scope :city,                  -> (city) {
                                      where(city: city)}
  scope :role_levels,           -> (role_levels) {
                                      where("'#{role_levels}' = ANY (role_levels)")}
  def self.filter(filter_params)
    results = where(nil)
    filter_params.each do |key, value|
      results = results.public_send(key, value) if value.present?
    end
    results
  end
  
  private

  def can_not_have_custom_city
    unless $DEVELOPER_COUNTRY_AREAS.include?(city)
      errors.add('Developer', 'can not have a custom city')
    end
  end
end
