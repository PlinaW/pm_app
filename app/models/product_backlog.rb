class ProductBacklog < ApplicationRecord
  belongs_to :project
  has_many :sprint_backlogs
  has_many :features
  has_many :project_members, through: :project
end
