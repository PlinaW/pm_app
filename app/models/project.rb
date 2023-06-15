class Project < ApplicationRecord
  has_many :epics, dependent: :destroy

  validates :name, presence: true,
                   uniqueness: { case_sensitive: false }
  # validates :start_date, comparison: { less_than: :end_date }, allow_blank: true
  validate :start_date_less_than_end_date?

  def start_date_less_than_end_date?
    return unless start_date && end_date

    errors.add(:start_date, 'Stacan\'t be less than end date') if end_date < start_date
  end
end
