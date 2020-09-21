# BILLINHO 

(README temporário - projeto em progresso)

### Ações da API até aqui
	-> Listagem de instituições (Todas ou individualmente pelo ID)
	-> Criação de instituições 
	-> Listagem de estudantes (Todos ou individualmente pelo ID)
	-> Criação de estudantes
	-> Listagem de matrículas (Todas ou individualmente pelo ID)
	-> Criação de matrículas

	-> Preenchimento automático de algumas instituições, estudantes e matrículas no banco de dados 

### Validações já implementadas
#####	Instituições
	-> Nome não vazio e único.
	-> CNPJ único, apenas com caracteres numéricos, porém não obrigatório.
	-> Tipo apenas 'Universidade', 'Escola' ou 'Creche'.

#####   Estudantes
	-> Nome não vazio e único.
	-> CPF não vazio, único e apenas com caracteres numéricos.
	-> Gênero apenas 'F' ou 'M'.
	-> Meio de pagamanto apenas 'Cartão' ou 'Boleto'.
	-> Data de nascimento não obrigatória.
	-> Telefone não obrigatório.

#####	Matrículas
	-> Valor total do curso não vazio e maior do que zero.
	-> Quantidade de faturas não vazio e maior ou igual a 1.
	-> Dia de vencimento das faturas não vazio, maior ou igual a 1 e menor ou igual a 31. 
	-> Nome do curso não vazio.
	-> ID da instituição não vazio.
	-> ID do estudante não vazio.

#####   Acrescentadas
	->Tamanho do CNPJ: 14 caracteres (obrigatoriamente)
	->Tamanho do CPF: 11 caracteres (obrigatoriamente)

