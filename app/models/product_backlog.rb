class ProductBacklog < ApplicationRecord
  belongs_to :project
  has_many :sprint_backlogs
end
