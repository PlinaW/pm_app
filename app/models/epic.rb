class Epic < ApplicationRecord
  belongs_to :project
  has_many :user_stories, dependent: :destroy

  validates :name, presence: true,
                   uniqueness: { scope: :project_id, case_sensitive: false }
  validates :priority, presence: true, uniqueness: { scope: :project_id }
end
