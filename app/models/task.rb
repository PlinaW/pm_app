class Task < ApplicationRecord
  include Timeable
  belongs_to :user, optional: true
  belongs_to :sprint, optional: true
  belongs_to :issue

  validates :name, presence: true,
             uniqueness: { case_sensitive: false, scope: :issue_id }
  validates :priority, presence: true, uniqueness: { scope: :issue_id }, allow_blank: true
  validate :starts_at_less_than_ends_at?
end
