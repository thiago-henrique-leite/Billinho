class Student < ApplicationRecord
  has_many :enrollments, dependent: :destroy
  has_many :bills, dependent: :destroy

  # Performs the necessary validations
  validates :name, presence: { message: 'Student name not informed.' }
  validates :gender, inclusion: { in: %w[M F], message: 'Invalid or not informed gender' }
  validates :pay_method, inclusion: { in: %w[Cartão Boleto], message: 'Invalid or not informed payment method.' }
  validate :valid_date?
  validates :cpf, :cpf => true
  validate :format_cpf

  # Formats the cpf
  def format_cpf
    cpf = CPF.new(self.cpf)
    cpf = cpf.formatted
    self.cpf = cpf
  end

  # Validates the student's birth date
  def valid_date?
    if birth_date
      errors.add(:birth_date, 'Invalid format.') unless birth_date.is_a?(Date)
    end
  end
end
