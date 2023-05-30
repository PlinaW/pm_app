class Task < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :sprint, optional: true
  belongs_to :user_story
end
