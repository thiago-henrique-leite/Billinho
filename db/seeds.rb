# Povoando o Banco de Dados

# Create institutions

cep = %w(76901050 58037305 76829374 76808340 66920780 69316760 29156544 98804700 18051730 69900487)

lista_instituicoes = %w(Universidade Escola Creche)

10.times do |indice|
  sorteio = Random.rand(0..2)

  Institution.create({
                       name: "#{lista_instituicoes[sorteio]} #{indice + 1}",
                       cnpj: CNPJ.generate,
                       kind: (lista_instituicoes[sorteio]).to_s,
                       cep: cep[indice]
                     })
end

# Create students

payment_methods = %w(Boleto Cartão)
genders = %w(M F)

10.times  do |indice|
  sorteio = Random.rand(0..1)

  Student.create({
                   name: "Estudante #{indice + 1}",
                   cpf: CPF.generate,
                   birth_date: Faker::Date.between(from: '1995-01-01', to: '2002-01-01'),
                   phone: Faker::Number.number(digits: 9),
                   gender: (genders[sorteio]).to_s,
                   pay_method: (payment_methods[sorteio]).to_s,
                   cep: cep[indice]
                 })
end

# Create enrollments

10.times do |indice|
  Enrollment.create({
                      total_value: Faker::Number.decimal(l_digits: 4, r_digits: 2),
                      ammount_bills: Faker::Number.between(from: 1, to: 10),
                      due_day: Faker::Number.between(from: 1, to: 31),
                      course: "Curso #{indice}",
                      institution_id: indice.to_s,
                      student_id: indice.to_s
                    })
end
