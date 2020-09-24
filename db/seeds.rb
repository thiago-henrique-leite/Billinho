# Povoando o Banco de Dados

# Cria instituições de ensino

lista_instituicoes = {1 => 'Universidade', 2 => 'Escola', 3 => 'Creche'}

50.times do |indice|
  sorteio = Random.rand(3) + 1

  Institution.create({
    nome: "#{lista_instituicoes[sorteio]} #{indice+1}",
    cnpj: Faker::Number.number(digits: 14),
    tipo: "#{lista_instituicoes[sorteio]}"
  })
end

# Cria estudantes

meios_pagamento = {1 => 'Boleto', 2 => 'Cartão'}
generos = {1 => 'M', 2 => 'F'}

50.times  do |indice|
  sorteio = Random.rand(2) + 1

	Student.create({
		nome: "Estudante #{indice+1}",
    cpf: Faker::Number.number(digits: 11),
    data_nasc: Faker::Date.between(from: '1995-01-01', to: '2002-01-01'),
    telefone: Faker::Number.number(digits: 9),
    genero: "#{generos[sorteio]}",
    meio_pagamento: "#{meios_pagamento[sorteio]}"
  })
end

# Cria matrículas

50.times do |indice|
  Enrollment.create({
    valor_total: Faker::Number.decimal(l_digits: 3, r_digits: 2),
    quant_faturas: Faker::Number.between(from: 1, to: 5),
    dia_vencimento: Faker::Number.between(from: 1, to: 31),
    curso: "Curso #{indice}",      
    institution_id: "#{indice}",
    student_id: "#{indice}"
  })
end
