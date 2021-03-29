class Enrollment < ApplicationRecord
  belongs_to :institution
  belongs_to :student

  has_many :bills

  # Performs the necessary validations
  validates :total_value, numericality: { greater_than: 0, message: 'Invalid or not informed total value.' }
  validates :amount_bills, numericality: { greater_than: 0, message: 'Invalid or unreported bills quantity.' }
  validates :due_day, numericality: { greater_than: 0, less_than: 32, message: 'Invalid or uninformed day.' }
  validates :course, presence: { message: 'Course not informed.' }
end
