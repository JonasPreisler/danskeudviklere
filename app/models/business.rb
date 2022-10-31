class Business < ApplicationRecord
  belongs_to :account
  validates_presence_of :name
  extend FriendlyId
  friendly_id :name, use: :slugged

end
