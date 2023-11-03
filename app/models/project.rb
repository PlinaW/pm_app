class Project < ApplicationRecord
  include Timeable
  include Status

  has_many :project_users, dependent: :destroy
  has_many :users, through: :project_users, dependent: :nullify
  has_many :issues, dependent: :destroy
  has_many :epics, dependent: :destroy

  validates :name, presence: true,
                   uniqueness: { case_sensitive: false }
  validate :start_date_less_than_end_date?
end
