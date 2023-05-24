class SprintBacklog < ApplicationRecord
  belongs_to :product_backlog
  has_many :features, through: :project_backlog
end
