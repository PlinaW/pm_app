class ProjectMember < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many :product_backlog, through: :project
  has_many :sprint_backlogs, through: :project
  has_many :features, through: :project
  has_many :user_stories, through: :project
end
