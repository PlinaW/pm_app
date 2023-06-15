class Sprint < ApplicationRecord
  include Timeable
  has_many :tasks, dependent: :nullify

  validates :name, presence: true,
             uniqueness: { case_sensitive: false }
  validate :start_date_less_than_end_date?
end
