module Timeable
  extend ActiveSupport::Concern

  included do
    scope :start_date, -> { where(start_date: true) }
    scope :end_date, -> { where(end_date: true) }
  end

  def start_date_less_than_end_date?
    return unless start_date && end_date

    errors.add(:start_date, 'can\'t be less than end date') if end_date < start_date
  end

  def starts_at_less_than_ends_at?
    return unless starts_at && ends_at

    errors.add(:starts_at, 'can\'t be less than end date') if ends_at < starts_at
  end
end
