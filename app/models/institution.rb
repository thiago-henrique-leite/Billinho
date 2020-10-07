class Institution < ApplicationRecord  
  has_many :enrollments
  has_many :bills

  # Performs the necessary validations
  validates :name, presence: { message: 'Institution name not informed.' }
  validates :kind, inclusion: { in: %w[Universidade Escola Creche], message: 'Institution kind invalid or not informed.' }
  validates :cnpj, :cnpj => true
  validate :format_cnpj
  validates :cep, correios_cep: true
  validate :fill_address

  private

  def format_cnpj
    cnpj = CNPJ.new(self.cnpj)
    cnpj = cnpj.formatted
    self.cnpj = cnpj
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
