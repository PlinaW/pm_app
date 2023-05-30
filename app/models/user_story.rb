class UserStory < ApplicationRecord
  belongs_to :feature

  has_many :tasks

end
