class Project < ApplicationRecord
  has_many :features

  validates :name, presence: true,
                   uniqueness: { case_sensitive: false },
                   length: { maximum: 100 }

end
