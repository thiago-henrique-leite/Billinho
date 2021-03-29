class Bill < ApplicationRecord
  # Calls another class reference
  belongs_to :enrollment
  belongs_to :student
  belongs_to :institution

  # Performs the necessary validations
  validate  :valid_paid_and_bill_value?
  validates :due_date, presence: true
  validates :status, inclusion: { in: %w[open pending paid], default: 'open', message: 'Invalid status.' }

  private

  def valid_paid_and_bill_value?
    return if (paid_value.nil? || paid_value&.positive?) && bill_value&.positive? 
    raise 'Paid value and Bill value cannot be less than zero'
  end
end