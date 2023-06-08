class UserStory < ApplicationRecord
  belongs_to :epic
  has_many :tasks

  validates :name, presence: true,
             uniqueness: { case_sensitive: false }
end
