class Sprint < ApplicationRecord
  has_many :tasks, dependent: :nullify

  validates :name, presence: true,
             uniqueness: { case_sensitive: false }
  validates :end_date, comparison: { greater_than: :start_date }
end
