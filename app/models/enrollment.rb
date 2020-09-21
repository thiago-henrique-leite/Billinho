class Enrollment < ApplicationRecord
    # Chama referência de outas classes
    belongs_to :institution
    belongs_to :student

    # Realiza as validações necessárias
    validates :valor_total, numericality: { greater_than: 0, message: "Valor total não informado ou inválido."}
	validates :quant_faturas, numericality: { greater_than: 0, message: "Quantidade de faturas inválida ou não informada."} 
	validates :dia_vencimento, numericality: { greater_than: 0, less_than: 32, message: "Dia inválido ou não informado." }
    validates :curso, presence: { message: "Curso não informado."}
end
