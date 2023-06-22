class UserStory < ApplicationRecord
  belongs_to :epic
  has_many :tasks

  validates :name, presence: true,
             uniqueness: { scope: :epic_id, case_sensitive: false }
  validates :priority, presence: true, uniqueness: { scope: :epic_id }, allow_blank: true
end
