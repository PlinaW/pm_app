class UserStory < ApplicationRecord
  belongs_to :feature
  has_many :project_members, through: :feature

  validates :name, presence: true

end
