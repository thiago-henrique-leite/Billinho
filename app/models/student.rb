class Student < ApplicationRecord
  has_many :enrollments
  has_many :bills

  # Performs the necessary validations
  validates :name, presence: { message: 'Student name not informed.' }
  validates :gender, inclusion: { in: %w[M F], message: 'Invalid or not informed gender' }
  validates :pay_method, inclusion: { in: %w[Cartão Boleto], message: 'Invalid or not informed payment method.' }
  validate :valid_date?
  validates :cpf, :cpf => true
  validate :format_cpf
  validates :cep, correios_cep: true
  validate :fill_address

  private

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
  
  def fill_address
    if self.cep != nil
      finder = Correios::CEP::AddressFinder.new
      address = finder.get(self.cep)
      self.city = address[:city]
      self.state = address[:state]
      self.neighborhood = address[:neighborhood]
      self.address = address[:address]
    end
  end
end
