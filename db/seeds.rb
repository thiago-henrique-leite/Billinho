# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

lista_instituicoes = {1 => 'Universidade', 2 => 'Escola', 3 => 'Creche'}

50.times do
    unidade = Random.rand(500) + 1
    tipo_institution = Random.rand(3) + 1

    Institution.create({
      nome: "#{lista_instituicoes[tipo_institution]} #{unidade}",
      cnpj: Faker::Number.number(digits: 14),
      tipo: "#{lista_instituicoes[tipo_institution]}"
    })
end

meios_pagamento = {1 => 'Boleto', 2 => 'Cartão'}

25.times  do
    pag = Random.rand(2) + 1

	Student.create({
		nome: Faker::Name.male_first_name,
        cpf: Faker::Number.number(digits: 11),
        data_nasc: Faker::Date.between(from: '1970-01-01', to: '2002-01-01'),
        phone: Faker::Number.number(digits: 9),
        genero: "M",
        meio_pagamento: "#{meios_pagamento[pag]}"
    })

    Student.create({
		nome: Faker::Name.female_first_name,
        cpf: Faker::Number.number(digits: 11),
        data_nasc: Faker::Date.between(from: '1970-01-01', to: '2002-01-01'),
        phone: Faker::Number.number(digits: 9),
        genero: "F",
        meio_pagamento: "#{meios_pagamento[pag]}"
    })
end