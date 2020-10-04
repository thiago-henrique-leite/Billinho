class Institution < ApplicationRecord  
  require "cpf_cnpj"

  has_many :enrollments, dependent: :destroy

  # Performs the necessary validations
  validates :name, presence: { message: 'Institution name not informed.' }
  validates :kind, inclusion: { in: %w[Universidade Escola Creche], message: 'Institution kind invalid or not informed.' }
  validates :cnpj, :cnpj => true
  validate :format_cnpj

  def format_cnpj
    cnpj = CNPJ.new(self.cnpj)
    cnpj = cnpj.formatted
    self.cnpj = cnpj
  end
end
