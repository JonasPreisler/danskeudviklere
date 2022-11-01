class Developer < ApplicationRecord
  belongs_to :account
  has_many :projects
  has_many :tools, through: :projects
  validates_presence_of :first_name, :last_name, :title, :about, :city, :search_status

  enum search_status: [:is_active, :unavailable, :invisible]

  mount_uploader :profile_picture, ProfilePictureUploader

  $DEVELOPER_LANGUAGES = ['Ruby', 'Ruby on Rails', 'Java', 'JavaScript', 'PHP', 'Python', 'C#', 'C++']
  $DEVELOPER_ROLE_TYPES = ['fulltime', 'parttime', 'remote', 'onsite']
  $DEVELOPER_SEARCH_STATUSES = ['is_active', 'unavailable', 'invisible']

  extend FriendlyId
  friendly_id :name, use: :slugged

  def name
    first_name.present? ? "#{first_name.capitalize} #{last_name.capitalize}" : ''
  end

  def zip
    city.first(4)
  end

end
