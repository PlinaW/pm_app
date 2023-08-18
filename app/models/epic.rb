class Epic < ApplicationRecord
  include Timeable
  include Status
  belongs_to :project
  has_many :user_stories, dependent: :destroy

  validates :name, presence: true,
                   uniqueness: { scope: :project_id, case_sensitive: false }
  validate :start_date_less_than_end_date?
end
