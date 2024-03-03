class TeamUser < ApplicationRecord
  belongs_to :team
  belongs_to :user

  enum role: %i[team_member team_admin]
end
