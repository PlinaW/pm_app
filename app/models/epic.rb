class Epic < ApplicationRecord
  belongs_to :project
  has_many :user_stories

  validates :name, presence: true,
                   uniqueness: { scope: :project_id, case_sensitive: false },
                   length: { maximum: 100 }

end
