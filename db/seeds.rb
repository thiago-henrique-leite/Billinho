# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Cria instituições de ensino

lista_instituicoes = {1 => 'Universidade', 2 => 'Escola', 3 => 'Creche'}
unidade = 0

50.times do
  unidade += 1
  tipo_institution = Random.rand(3) + 1

  Institution.create({
    nome: "#{lista_instituicoes[tipo_institution]} #{unidade}",
    cnpj: Faker::Number.number(digits: 14),
    tipo: "#{lista_instituicoes[tipo_institution]}"
  })
end

# Cria estudantes

meios_pagamento = {1 => 'Boleto', 2 => 'Cartão'}

25.times  do
  pagamento = Random.rand(2) + 1

	Student.create({
		nome: Faker::Name.male_first_name,
    cpf: Faker::Number.number(digits: 11),
    data_nasc: Faker::Date.between(from: '1970-01-01', to: '2002-01-01'),
    phone: Faker::Number.number(digits: 9),
    genero: "M",
    meio_pagamento: "#{meios_pagamento[pagamento]}"
  })

  Student.create({
	  nome: Faker::Name.female_first_name,
    cpf: Faker::Number.number(digits: 11),
    data_nasc: Faker::Date.between(from: '1970-01-01', to: '2002-01-01'),
    phone: Faker::Number.number(digits: 9),
    genero: "F",
    meio_pagamento: "#{meios_pagamento[pagamento]}"
  })
end

# Cria matrículas

indice = 0

50.times do
  indice += 1

  Enrollment.create({
    valor_total: Faker::Number.decimal(l_digits: 3, r_digits: 2),
    quant_faturas: Faker::Number.number(digits: 2),
    dia_vencimento: Faker::Number.between(from: 1, to: 31),
    curso: "Curso #{indice}",      
    institution_id: "#{indice}",
    student_id: "#{indice}"
  })

end
