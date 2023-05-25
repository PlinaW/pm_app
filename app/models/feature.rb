class Feature < ApplicationRecord
  belongs_to :product_backlog
  has_many :user_stories
end
