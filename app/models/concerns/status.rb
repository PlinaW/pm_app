module Status
  extend ActiveSupport::Concern

  VALID_STATUSES = ['active', 'suspended', 'ended', 'to do', 'pending', 'done'].freeze

  included do
    scope :active, -> { where(status: 'active') }
    validates :status, inclusion: { in: VALID_STATUSES }
  end

  def active?
    status == 'active'
  end
end
