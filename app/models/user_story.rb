class UserStory < ApplicationRecord
  belongs_to :feature
  has_many :project_members, through: :feature
end
