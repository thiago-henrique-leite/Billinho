# Povoando o Banco de Dados

# Cria instituições de ensino

lista_instituicoes = { 1 => 'Universidade', 2 => 'Escola', 3 => 'Creche' }

50.times do |indice|
  sorteio = Random.rand(1..3)

  Institution.create({
                       name: "#{lista_instituicoes[sorteio]} #{indice + 1}",
                       cnpj: CNPJ.generate,
                       kind: (lista_instituicoes[sorteio]).to_s
                     })
end

# Cria estudantes

meios_pagamento = { 1 => 'Boleto', 2 => 'Cartão' }
genders = { 1 => 'M', 2 => 'F' }

50.times  do |indice|
  sorteio = Random.rand(1..2)

  Student.create({
                   name: "Estudante #{indice + 1}",
                   cpf: CPF.generate,
                   birth_date: Faker::Date.between(from: '1995-01-01', to: '2002-01-01'),
                   phone: Faker::Number.number(digits: 9),
                   gender: (genders[sorteio]).to_s,
                   pay_method: (meios_pagamento[sorteio]).to_s
                 })
end

# Cria matrículas

50.times do |indice|
  Enrollment.create({
                      total_value: Faker::Number.decimal(l_digits: 4, r_digits: 2),
                      ammount_bills: Faker::Number.between(from: 1, to: 10),
                      due_day: Faker::Number.between(from: 1, to: 31),
                      course: "Curso #{indice}",
                      institution_id: indice.to_s,
                      student_id: indice.to_s
                    })
end
