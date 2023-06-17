module Timeable
  extend ActiveSupport::Concern

  def start_date_less_than_end_date?
    return unless !start_date.nil? && !end_date.nil?

    errors.add(:start_date, 'can\'t be less than end date') if end_date < start_date
  end

  def starts_at_less_than_ends_at?
    return unless starts_at && ends_at

    errors.add(:starts_at, 'can\'t be less than end date') if ends_at < starts_at
  end
end
