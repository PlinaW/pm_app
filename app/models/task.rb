class Task < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :sprint, optional: true
  belongs_to :user_story

  validates :name, presence: true
  validates :description, presence: true
  validates :status, presence: true
  validates :priority, presence: true
  validates :created_by, presence: true
  validates :comment, presence: true

end
