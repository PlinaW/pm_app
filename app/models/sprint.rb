class Sprint < ApplicationRecord
  belongs_to :project
  has_many :tasks, dependent: :nullify
end
