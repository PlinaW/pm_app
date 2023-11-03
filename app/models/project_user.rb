class ProjectUser < ApplicationRecord
  belongs_to :project
  belongs_to :user

  enum roles: { user: 0, developer: 1, manager: 2, admin: 3 }
end
