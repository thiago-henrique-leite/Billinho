# ***BILLINHO*** <img src="https://sobre.quero.com/wp-content/themes/quero-b2b-institutional/dist/img/logos/quero/quero_institucional_azul_mobo.svg" height = "36" width = "36"> <img src="https://img.itch.zone/aW1nLzMxNTMyMTEucG5n/original/GsOFLx.png" height = "50" width = "50">

### Descrição :pencil:
> O Billinho é um projeto da Quero Educação, empresa líder no ramo de marketing educacional. 
  Ele tem por objetivo simular uma API de gerenciamento das mensalidades pagas pelos alunos 
  á instituição de ensino que ele estuda.

### Status do Projeto
> :construction: Em construção... :construction:

### Entidades da API
> Essas são as entidades básicas do projeto.

> ***Instituição de Ensino***

>   Campo  |   Tipo   |           Restrições
>----------|----------|----------------------------------
>   Nome   |   Texto  | Não vazio e único
>   CNPJ   |   Texto  | 14 caracteres numéricos e único
>   Tipo   |   Texto  | Universidade, Escola ou Creche

> ***Aluno***


>Campo               |   Tipo   |                Restrições
>--------------------|----------|---------------------------------------------
>Nome                |   Texto  | Não vazio e único
>CPF                 |   Texto  | 11 caracteres numéricos, único e não vazio 
>Data de Nascimento  |   Data   | Formato yyyy-mm-dd (Facultativo)
>Telefone            |  Inteiro | 
>Gênero              |   Texto  | M ou F
>Meio de pagamento   |   Texto  | Boleto ou Cartão

> ***Matrícula***

>Campo                        |   Tipo              |                 Restrições
>-----------------------------|---------------------|-----------------------------------------------
>Valor total do curso         |  Decimal            | Não vazio, > 0
>Quantidade de faturas        |  Inteiro            | Não vazio, >= 1
>Dia de vencimento das faturas|  Inteiro            | Não vazio, >= 1 e <= 31
>Nome do curso                |  Texto              | Não vazio
>Id da instituição            |  Chave estrangeira  | Não vazio
>Id do aluno                  |  Chave estrangeira  | Não vazio

> ***Faturas***

>Campo                        |   Tipo              |                 Restrições
>-----------------------------|---------------------|-----------------------------------------------
>Valor da fatura em reais     |  Decimal            | Não vazio
>Data de vencimento           |  Data               | Não vazio
>Id da matrícula              |  Chave estrangeira  | Não vazio
>Status                       |  Texto              | Aberta, Atrasada ou Paga sendo default Aberta

### Ações da API

###### Instituições
>  -	[x] Listagem.
>  -	[x] Criação.
>  -	[x] Atualização.
>  -  [ ] Exclusão. 

###### Estudantes
>  -	[x] Listagem.
>  -	[x] Criação.
>  -	[x] Atualização.
>  -  [ ] Exclusão. 

###### Matrículas
>  -	[x] Listagem.
>  -	[x] Criação.
>  -  [ ] Atualização.
>  -  [ ] Exclusão. 

###### Faturas
>  -	[x] Listagem.
>  -	[x] Criação.
>  -	[x] Atualização.
>  -  [ ] Exclusão. 

### Pré Requisitos da Aplicação :warning:
> - Ruby 2.7.1
> - Rails 6.0.3.3
> - PostgreSQL 12

### Como rodar a aplicação :rocket:
##### Clone este repositório
> $ git clone git@github.com:thiago-henrique-leite/Billinho.git

##### Acesse a pasta do projeto no terminal/cmd
> $ cd etc/Billinho

##### Baixe as dependências do projeto
> $ bundle install

##### Crie o banco de dados 
> $ rails db:create
> $ rails db:migrate

##### Preencha o banco com os valores padrões
> $ rails db:seed

##### Rode a aplicação
> $ rails s

##### O servidor inciará na porta:3000 - acesse <http://localhost:3000> 

##### Utilize o Postman para uma melhor visualização da aplicação

### Informações adicionais
> Todos as rotas da API recebam e respondam com dados no formato JSON

### Projeto em Execução

#### Instituições

##### Visualizando todas as instituições: GET api/v1/institutions
> Retorno:

```json
"status": "SUCCESSO",
    "message": "Instituições de Ensino Carregadas.",
    "data": [
        {
            "id": 1,
            "nome": "Escola 1",
            "cnpj": "60392739875145",
            "tipo": "Escola",
            "created_at": "2020-09-23T17:36:41.328Z",
            "updated_at": "2020-09-23T17:36:41.328Z"
        },
        {
            "id": 2,
            "nome": "Universidade 1",
            "cnpj": "95014120212917",
            "tipo": "Universidade",
            "created_at": "2020-09-23T17:36:41.333Z",
            "updated_at": "2020-09-23T17:36:41.333Z"
        },

```


 ##### Visualizando instituição específica: GET api/v1/institutions/1
 > Parâmetros: id da instituição 

 > Retorno: 

```json
"status": "SUCCESSO",
    "message": "Instituição de Ensino Carregada.",
    "data": [
        {
            "id": 1,
            "nome": "Escola 1",
            "cnpj": "60392739875145",
            "tipo": "Escola",
            "created_at": "2020-09-23T17:36:41.328Z",
            "updated_at": "2020-09-23T17:36:41.328Z"
        }
```

 ##### Criando instituição: POST api/v1/institutions
 > Requisição

```json
{
        "nome": "Universidade 2",
        "cnpj": "00000000000000",
        "tipo": "Universidade"
}
```
> Retorno:

```json
{
    "status": "SUCCESSO",
    "message": "Instituição Cadastrada.",
    "data": {
        "id": 3,
        "nome": "Universidade 2",
        "cnpj": "00000000000000",
        "tipo": "Universidade",
        "created_at": "2020-09-23T22:00:21.337Z",
        "updated_at": "2020-09-23T22:00:21.337Z"
    }
}
```

 ##### Atualizando instituição: PUT api/v1/institutions/3
 > Parâmetros: id da instituição

> Na requisição colocar apenas o campo que quer atualizar.

> Requisição:

```json
{
        "cnpj": "18899965478530"
}
```
> Retorno

```json
{
    "status": "SUCCESSO",
    "message": "Instituição Cadastrada.",
    "data": {
        "id": 3,
        "nome": "Universidade 2",
        "cnpj": "18899965478530",
        "tipo": "Universidade",
        "created_at": "2020-09-23T22:00:21.337Z",
        "updated_at": "2020-09-23T22:00:21.337Z"
    }
}
```

 ##### Visualizando todos os estudantes: GET api/v1/students

 > Retorno:

```json
{
    "status": "SUCCESSO",
    "message": "Lista de estudantes carregada.",
    "data": [
        {
            "id": 1,
            "nome": "Estudante 1",
            "cpf": "98404479771",
            "data_nasc": "2001-04-10",
            "telefone": 116469569,
            "genero": "F",
            "meio_pagamento": "Cartão",
            "created_at": "2020-09-23T17:36:43.628Z",
            "updated_at": "2020-09-23T17:36:43.628Z"
        },
        {
            "id": 2,
            "nome": "Estudante 2",
            "cpf": "75211848308",
           "data_nasc": "1995-07-24",
            "telefone": 874784207,
            "genero": "M",
            "meio_pagamento": "Boleto",
            "created_at": "2020-09-23T17:36:43.634Z",
            "updated_at": "2020-09-23T17:36:43.634Z"
         },
```

 ##### Visualizando estudante específica: GET api/v1/students/1
 > Parâmetros: id do estudante

 > Retorno: 

```json
{
    "status": "SUCCESSO",
    "message": "Dados do estudante carregados.",
    "data": {
        "id": 1,
        "nome": "Estudante 1",
        "cpf": "98404479771",
        "data_nasc": "2001-04-10",
        "telefone": 116469569,
        "genero": "F",
        "meio_pagamento": "Cartão",
        "created_at": "2020-09-23T17:36:44.081Z",
        "updated_at": "2020-09-23T17:36:44.081Z"
    }
}
```
##### Criando estudante: POST api/v1/students
> Requisição

```json
{
        "nome": "Aluno 1",
        "cpf": 12345678910,
        "genero": "M",
        "meio_pagamento": "Cartão",
        "data_nasc": "2000-12-07",
        "telefone": 998804342
}
```

> Retorno: 

```json
{
    "status": "SUCCESSO",
    "message": "Estudante Cadastrado.",
    "data": {
        "id": 3,
        "nome": "Aluno 1",
        "cpf": "12345678910",
        "data_nasc": "2000-12-07",
        "telefone": 998804342,
        "genero": "M",
        "meio_pagamento": "Cartão",
        "created_at": "2020-09-23T22:39:13.899Z",
        "updated_at": "2020-09-23T22:39:13.899Z"
    }
}
```

##### Atualizando estudante: PUT api/v1/students/3
 > Parâmetros: id do estudante

> Na requisição colocar apenas o campo que quer atualizar.

> Requisição:

```json
{
        "meio_pagamento": "Boleto",
        "telefone": 822398342
}
```

> Resposta:

```json
{
    "status": "SUCCESSO",
    "message": "Estudante Cadastrado.",
    "data": {
        "id": 3,
        "nome": "Aluno 1",
        "cpf": "12345678910",
        "data_nasc": "2000-12-07",
        "telefone": 822398342,
        "genero": "M",
        "meio_pagamento": "Boleto",
        "created_at": "2020-09-23T22:39:13.899Z",
        "updated_at": "2020-09-23T22:39:13.899Z"
    }
}
```