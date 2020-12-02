class Bill < ApplicationRecord
  # Calls another class reference
  belongs_to :enrollment
  belongs_to :student
  belongs_to :institution

  # Performs the necessary validations
  validates :bill_value, presence: true
  validates :due_date, presence: true
  validates :status, inclusion: { in: %w[open pending paid], default: 'open', message: 'Invalid status.' }
end
