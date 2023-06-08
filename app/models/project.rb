class Project < ApplicationRecord
  has_many :epics, dependent: :destroy

  validates :name, presence: true,
                   uniqueness: { case_sensitive: false }
  validates :end_date, comparison: { greater_than: :start_date }
end
