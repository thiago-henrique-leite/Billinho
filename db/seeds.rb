# Povoando o Banco de Dados

# Create institutions

10.times do |indice|
  ies = %w[Universidade Escola Creche].sample

  Institution.create({
                      name: "#{ies} #{indice + 1}",
                      cnpj: CNPJ.generate,
                      kind: ies,
                      cep: "11070-200"
                    })
end
# Create students
10.times  do |indice|

  Student.create({
                  name: "Estudante #{indice + 1}",
                  cpf: CPF.generate,
                  birth_date: Faker::Date.between(from: '1995-01-01', to: '2002-01-01'),
                  phone: Faker::Number.number(digits: 9),
                  gender: %w[M F].sample,
                  pay_method: %w[Boleto Cartão].sample,
                  cep: "23078-002"
                })
end

# Create enrollments

10.times do |indice|
  Enrollment.create({
                      total_value: Faker::Number.decimal(l_digits: 4, r_digits: 2),
                      amount_bills: Faker::Number.between(from: 1, to: 10),
                      due_day: Faker::Number.between(from: 1, to: 31),
                      course: "Curso #{indice+1}",
                      institution_id: (indice + 1).to_s,
                      student_id: (indice + 1).to_s
                    })
end