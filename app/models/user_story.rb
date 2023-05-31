class UserStory < ApplicationRecord
  belongs_to :feature
  has_many :tasks

  validates :name, presence: true,
             uniqueness: { scope: :project_id, case_sensitive: false },
             length: { maximum: 250 }

end
