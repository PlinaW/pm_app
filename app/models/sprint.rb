class Sprint < ApplicationRecord
  has_many :tasks, dependent: :nullify

  validates :name, presence: true,
             uniqueness: { case_sensitive: false },
             length: { maximum: 100 }

end
