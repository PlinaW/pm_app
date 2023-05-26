class SprintBacklog < ApplicationRecord
  belongs_to :product_backlog
  has_many :features
  has_many :user_stories, through: :features
  has_many :project_members, through: :product_backlog

  validates :name, presence: true

end
