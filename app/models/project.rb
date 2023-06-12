class Project < ApplicationRecord
  has_many :epics, dependent: :destroy

  validates :name, presence: true,
                   uniqueness: { case_sensitive: false }
  validates :start_date, comparison: { less_than: :end_date }, allow_blank: true
  # This probably needs to be changed in the future
  # to allow to also specify start_date without end_date
end
