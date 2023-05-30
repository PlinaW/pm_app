class Feature < ApplicationRecord
  belongs_to :project

  has_many :user_stories

end
