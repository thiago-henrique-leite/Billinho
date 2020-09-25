class Bill < ApplicationRecord
  # Chama referência de outra classe
  belongs_to :enrollment
  belongs_to :student

  # Realiza as validações necessárias
  validates :valor_fatura, presence: true
  validates :data_vencimento, presence: true
  validates :status, inclusion: { in: %w[Aberta Atrasada Paga], default: 'Aberta', message: 'Status inválido.' }
end
