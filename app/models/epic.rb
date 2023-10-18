class Epic < ApplicationRecord
  include Timeable
  include Status
  belongs_to :project
  belongs_to :author, class_name: 'User', foreign_key: 'author_id', optional: true
  has_many :issues, dependent: :destroy

  validates :name, presence: true,
                   uniqueness: { scope: :project_id, case_sensitive: false }
  validate :start_date_less_than_end_date?
end
