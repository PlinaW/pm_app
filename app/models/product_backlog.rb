class ProductBacklog < ApplicationRecord
  belongs_to :project
  has_many :sprint_backlogs
  has_many :features
  has_many :user_stories, through: :features
  has_many :project_members, through: :project

  validates :name, presence: true

end
