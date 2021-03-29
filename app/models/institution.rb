class Institution < ApplicationRecord
  has_many :enrollments
  has_many :bills

  # Performs the necessary validations
  validates :name, presence: { message: 'Institution name not informed.' }
  validates :kind, inclusion: { in: %w[Universidade Escola Creche], message: 'Institution kind invalid or not informed.' }
  validates :cnpj, cnpj: true
  validate :format_cnpj
  validates :cep, correios_cep: true
  validate :fill_address

  private

  def format_cnpj
    self.cnpj = CNPJ.new(self.cnpj).formatted
  end

  def fill_address
    unless cep.nil?
      address = Correios::CEP::AddressFinder.new.get(cep)
      self.city = address[:city]
      self.state = address[:state]
      self.neighborhood = address[:neighborhood]
      self.address = address[:address]
    else 
      raise 'Zip code not informed.'
    end
  end
end
