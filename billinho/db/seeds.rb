# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

lista_instituicoes = { 1 => 'Universidade', 2 => 'Escola', 3 => 'Creche' }

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
      name: "#{lista_instituicoes[tipo_inst]} #{var}",
      cnpj: Faker::Number.number(digits: 11),
      tipo: "#{lista_instituicoes[tipo_inst]}"
    })
end