class Task < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :sprint, optional: true
  belongs_to :user_story

  validates :name, presence: true,
             uniqueness: { case_sensitive: false, scope: :user_story_id }
  validates :priority, presence: true, uniqueness: { scope: :user_story_id }, allow_blank: true
  validates :ends_at, comparison: { greater_than: :starts_at }, allow_blank: true
end
