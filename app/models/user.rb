class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :project_users, dependent: :destroy
  has_many :projects, through: :project_users
  has_many :team_users, dependent: :destroy
  has_many :teams, through: :team_users

  # has_many :issue_users
  # has_many :issues, through: :issue_users
  # has_many :authored_issues, class_name: 'Issue', foreign_key: 'author_id'
  # has_many :authored_epics, class_name: 'Epic', foreign_key: 'author_id'
  # has_many :tasks, dependent: :nullify

  enum role: %i[user admin]

  # validates :first_name, :last_name, presence: true

  def full_name
    return "#{first_name} #{last_name}" if first_name || last_name

    'Anonymous'
  end
end
