class UserStory < ApplicationRecord
  belongs_to :epic
  has_many :tasks

  validates :name, presence: true,
             uniqueness: { case_sensitive: false },
             length: { maximum: 250 }

end
