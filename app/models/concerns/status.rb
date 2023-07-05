module Status
  extend ActiveSupport::Concern

  VALID_STATUSES = ['active', 'suspended', 'ended', 'to do', 'pending', 'done'].freeze

  included do
    validates :status, inclusion: { in: VALID_STATUSES }
  end

  class_methods do
    def active_count
      where(status: 'active').count
    end
  end

  def active?
    status == 'active'
  end
end
