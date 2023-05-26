class Project < ApplicationRecord
  has_one :product_backlog
  has_many :sprint_backlogs, through: :product_backlog
  has_many :features, through: :product_backlog
  has_many :user_stories, through: :product_backlog
  has_many :project_members
  has_many :users, through: :project_members
end
