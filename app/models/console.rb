class Console < ApplicationRecord
  validates_presence_of :name, :manufacturer

  scope :nintendo, -> { where(manufacturer: 'Nintendo') }

  def formatted_name
    manufacturer + ' ' + name
  end
end
