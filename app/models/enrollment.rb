class Enrollment < ApplicationRecord
    belongs_to :institution_id
    belongs_to :student_id

    validates :valor_total, numericality: { greater_than: 0, message: "Valor total não informado."}
	validates :quant_faturas, numericality: { greater_than: 0, message: "Quantidade de faturas inválida."} 
	validates :dia_vencimento, numericality: { greater_than: 0, less_than: 32, message: "Dia inválido." }
	validates :curso, presence: { message: "Curso não informado."}
end
