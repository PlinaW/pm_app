class Feature < ApplicationRecord
  belongs_to :product_backlog
  belongs_to :sprint_backlog, optional: true
  has_many :user_stories
  has_many :project_members, through: :product_backlog

  validates :name, presence: true

end
