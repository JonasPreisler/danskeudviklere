class Project < ApplicationRecord
  belongs_to :developer
  has_many   :projects_tools
  has_many   :tools, through: :projects_tools
  validates_presence_of :about
end
