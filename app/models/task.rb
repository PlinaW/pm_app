class Task < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :sprint, optional: true
  belongs_to :user_story

  validates :name, presence: true,
             uniqueness: { case_sensitive: false },
             length: { maximum: 100 }
end
