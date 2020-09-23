# BILLINHO 

(README temporário - projeto em progresso)

### Ações da API até aqui
	-> Listagem de instituições (Todas ou individualmente pelo ID da instituição).
	-> Criação de instituições.
	-> Atualização dos dados da instituição.

	-> Listagem de estudantes (Todos ou individualmente pelo ID do estudante).
	-> Criação de estudantes.
	-> Atualização dos dados de um estudante.

	-> Listagem de matrículas (Todas, individualmente pelo ID da matrícula ou listar
	todas as matrículas de uma instituição pelo ID dela).
	-> Criação de matrículas.

	-> Listagem de faturas (Todas, individualmente pelo ID da fatura ou individualmente
	pelo ID da matrícula do aluno).
	-> Criação de faturas (Feita automaticamente ao criar uma matrícula).
	-> Atualização do status da fatura.

	-> Preenchimento automático de algumas instituições, estudantes, matrículas, e 
	consequentemente, faturas no banco de dados 

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
	-> Data de nascimento não obrigatória e só guarda no banco se estiver no formato YYYY-MM-DD.
	-> Telefone não obrigatório.

#####	Matrículas
	-> Valor total do curso não vazio e maior do que zero.
	-> Quantidade de faturas não vazio e maior ou igual a 1.
	-> Dia de vencimento das faturas não vazio, maior ou igual a 1 e menor ou igual a 31. 
	-> Nome do curso não vazio.
	-> ID da instituição não vazio.
	-> ID do estudante não vazio.

#####	Faturas
	-> Valor da fatura não vazio.
	-> Data de vencimento das faturas não vazio.
	-> ID da matrícula não vazio.
	-> Status da fatura apenas 'Aberta', 'Atrasada' ou 'Paga', sendo default 'Aberta'.

#####   Acrescentadas
	-> Tamanho do CNPJ: 14 caracteres (obrigatoriamente)
	-> Tamanho do CPF: 11 caracteres (obrigatoriamente)
	-> Em relação as faturas, se o mês vigente não possuir o dia de vencimento especificado 
	pelo aluno, a data de vencimento da fatura passa para o dia 1 do mês seguinte.

	(Exemplo) O dia de vencimento das faturas é 31, como setembro tem apenas 30 dias, a fatura 
	vence dia 1 de outubro, a próxima, referente ao mês de outubro, segue normalmente, retornando 
	o vencimento para o dia 31.

