class Student < ApplicationRecord
	validates :nome, presence: true
	validates :cpf, presence: true
	validates :genero, presence: true
	validates :meio_pagamento, presence: true
end
