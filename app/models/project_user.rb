class ProjectUser < ApplicationRecord
  belongs_to :project
  belongs_to :user

  enum role: %i[project_member project_admin]
end
