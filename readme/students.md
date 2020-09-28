#### 8.2 Estudantes

  ***8.2.1 Visualizando todos os estudantes: GET api/v1/students***

>   Retorno:

```json
{
    "status": "SUCESSO",
    "message": "Lista de Estudantes Carregada.",
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

  ***8.2.2 Visualizando estudante específico: GET api/v1/students/1***

>   Parâmetros: id do estudante

>   Retorno: 

```json
{
    "status": "SUCESSO",
    "message": "Estudante 5 carregado.",
    "data": {
        "id": 5,
        "nome": "Estudante A",
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

  ***8.2.3 Criando estudante: POST api/v1/students***

>   Parâmetros: Nome, cpf, gênero e meio de pagamento das faturas 

>   Requisição

```json
{
        "nome": "Aluno 1",
        "cpf": "12345678910",
        "genero": "M",
        "meio_pagamento": "Cartão",
        "data_nasc": "2000-12-07",
        "telefone": 998804342
}
```

>  Retorno: 

```json
{
    "status": "SUCESSO",
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

  ***8.2.4 Atualizando estudante: PUT api/v1/students/3***

>   Parâmetros: id do estudante

>   Na requisição colocar apenas o campo que quer atualizar.

>   Requisição:

```json
{
        "meio_pagamento": "Boleto",
        "telefone": 822398342
}
```

>   Resposta:

```json
{
    "status": "SUCESSO",
    "message": "Estudante 3 Atualizado.",
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

  ***8.2.5 Deletando um estudante: DELETE api/v1/students/10***

>   Parâmetros: id do estudante
>   Obs: A exclusão de um estudante exclui também todas as matrículas e faturas vinculadas a ele.

>   Retorno:

```json
{
    "status": "SUCESSO",
    "message": "Estudante 10 deletado",
    "data": {
        "id": 10,
        "nome": "Estudante 10",
        "cpf": "55446907512",
        "data_nasc": "1998-01-19",
        "telefone": 599955516,
        "genero": "F",
        "meio_pagamento": "Cartão",
        "created_at": "2020-09-24T18:25:55.870Z",
        "updated_at": "2020-09-24T18:25:55.870Z"
    }
}
```