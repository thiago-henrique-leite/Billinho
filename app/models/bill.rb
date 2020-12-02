class Bill < ApplicationRecord
  # Calls another class reference
  belongs_to :enrollment
  belongs_to :student
  belongs_to :institution

  # Performs the necessary validations
  validates :bill_value, presence: true
  validates :paid_value, presence: { allow_nil: true, message: 'Paid value cannot be less than zero'}
  validate  :valid_paid_value?
  validates :due_date, presence: true
  validates :status, inclusion: { in: %w[open pending paid], default: 'open', message: 'Invalid status.' }

  private

  def valid_paid_value?
    return true if (self.paid_value.nil? || self.paid_value > 0)
  end
end
