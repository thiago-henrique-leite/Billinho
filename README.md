# BILLINHO 

(README temporário - projeto em progresso)

### Ações da API até aqui
	-> Listagem de instituições (Todas ou individualmente pelo ID)
	-> Criação de instituições 
	-> Listagem de estudantes (Todos ou individualmente pelo ID)
	-> Criação de estudantes

	-> Preenchimento automático de algumas instituições e estudantes no banco de dados 

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

#####   Acrescentadas
	->Tamanho do CNPJ: 14 caracteres (obrigatoriamente)
	->Tamanho do CPF: 11 caracteres (obrigatoriamente)

