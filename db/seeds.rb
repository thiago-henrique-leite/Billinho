# Povoando o Banco de Dados

# Cria instituições de ensino

lista_instituicoes = { 1 => 'Universidade', 2 => 'Escola', 3 => 'Creche' }

50.times do |indice|
  sorteio = Random.rand(1..3)

  Institution.create({
                       nome: "#{lista_instituicoes[sorteio]} #{indice + 1}",
                       cnpj: Faker::Number.number(digits: 14),
                       tipo: (lista_instituicoes[sorteio]).to_s
                     })
end

# Cria estudantes

meios_pagamento = { 1 => 'Boleto', 2 => 'Cartão' }
generos = { 1 => 'M', 2 => 'F' }

50.times  do |indice|
  sorteio = Random.rand(1..2)

  Student.create({
                   nome: "Estudante #{indice + 1}",
                   cpf: Faker::Number.number(digits: 11),
                   data_nasc: Faker::Date.between(from: '1995-01-01', to: '2002-01-01'),
                   telefone: Faker::Number.number(digits: 9),
                   genero: (generos[sorteio]).to_s,
                   meio_pagamento: (meios_pagamento[sorteio]).to_s
                 })
end

# Cria matrículas

50.times do |indice|
  Enrollment.create({
                      valor_total: Faker::Number.decimal(l_digits: 4, r_digits: 2),
                      quant_faturas: Faker::Number.between(from: 1, to: 10),
                      dia_vencimento: Faker::Number.between(from: 1, to: 31),
                      curso: "Curso #{indice}",
                      institution_id: indice.to_s,
                      student_id: indice.to_s
                    })
end
