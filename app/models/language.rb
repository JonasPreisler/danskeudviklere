class Language < ApplicationRecord
  has_many :developers_languages
  has_many :developers, through: :developers_languages

  validates_presence_of :name
end
