class SprintBacklog < ApplicationRecord
  belongs_to :product_backlog
  has_many :features, through: :project_backlog
  has_many :user_stories, through: :features
  has_many :project_members, through: :project_backlog
end
