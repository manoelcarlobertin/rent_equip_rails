class Schedule < ApplicationRecord
  belongs_to :equipment

  STATUSES = %w[pending in_progress done].freeze

  validates :status, presence: true, inclusion: { in: STATUSES }
  validates :period_start, :period_end, presence: true
  validate :period_end_after_period_start

  private

  def period_end_after_period_start
    return if period_end.blank? || period_start.blank?

    if period_end < period_start
      errors.add(:period_end, "deve ser igual ou posterior ao início do período")
    end
  end
end
