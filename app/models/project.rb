class Project < ApplicationRecord
  include Timeable
  include Status
  has_many :epics, dependent: :destroy

  validates :name, presence: true,
                   uniqueness: { case_sensitive: false }
  validate :start_date_less_than_end_date?
end
