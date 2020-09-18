# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

lista_instituicoes = {1 => 'Universidade', 2 => 'Escola', 3 => 'Creche'}
universidade = 0
escola = 0
creche = 0

50.times do
    var = Random.rand(3) + 1
    tipo_inst = var

    if var == 1
        universidade += 1
        var =  universidade
    elsif var == 2
        escola += 1
        var = escola
    else
        creche += 1
        var = creche
    end

    Institution.create({
      nome: "#{lista_instituicoes[tipo_inst]} #{var}",
      cnpj: Faker::Number.number(digits: 11),
      tipo: "#{lista_instituicoes[tipo_inst]}"
    })
end

meios_pagamento = {1 => 'Boleto', 2 => 'Cartão'}
generos = {1 => 'F', 2 => 'M'}

50.times  do
    var1 = Random.rand(2) + 1
    var2 = Random.rand(2) + 1

	Student.create({
		nome: Faker::Name.name,
        cpf: Faker::Number.number(digits: 11),
        data_nasc: Faker::Date.between(from: '1970-01-01', to: '2002-01-01'),
        phone: Faker::Number.number(digits: 9),
        genero: "#{generos[var1]}",
        meio_pagamento: "#{meios_pagamento[var2]}"
	})
end