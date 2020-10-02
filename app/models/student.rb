class Student < ApplicationRecord
  has_many :enrollments, dependent: :destroy
  has_many :bills, dependent: :destroy

  # Performs the necessary validations
  validates :name, presence: { message: 'Student name not informed.' }
  validates :cpf, :cpf => true
  validates :gender, inclusion: { in: %w[M F], message: 'Invalid or not informed gender' }
  validates :pay_method, inclusion: { in: %w[Cartão Boleto], message: 'Invalid or not informed payment method.' }
  validate :data_valida?

  private

  # Validates the student's birth date
  def data_valida?
    if birth_date
      errors.add(:birth_date, 'Invalid format.') unless birth_date.is_a?(Date)
    end
  end
end
