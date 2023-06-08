class Task < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :sprint, optional: true
  belongs_to :user_story

  validates :name, presence: true,
             uniqueness: { case_sensitive: false }
  validates :ends_at, comparison: { greater_than: :starts_at }
end
