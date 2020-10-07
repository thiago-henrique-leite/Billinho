#### 8.2 Estudantes

  ***8.2.1 Visualizando todos os estudantes: GET api/v1/students***

>   Retorno:

```json
{
    "message": "All students loaded.",
    "data": [
        {
            "id": 1,
            "name": "Estudante 1",
            "cpf": "984.044.797-71",
            "birth_date": "2001-04-10",
            "phone": 116469569,
            "gender": "F",
            "pay_method": "Cartão",
            "cep": "29156544",
            "address": "Travessa Santa Luzia",
            "state": "ES",
            "neighborhood": "Santa Luzia",
            "city": "Cariacica",
            "enabled_std": "true",
            "created_at": "2020-09-23T17:36:43.628Z",
            "updated_at": "2020-09-23T17:36:43.628Z"
        },
        {
            "id": 2,
            "name": "Estudante 2",
            "cpf": "752.118.483-08",
            "birth_date": "1995-07-24",
            "phone": 874784207,
            "gender": "M",
            "pay_method": "Boleto",
            "cep": "98804700",
            "address": "Rua Plínio Salgado",
            "state": "RS",
            "neighborhood": "Haller",
            "city": "Santo Ângelo",
            "enabled_std": "true",
            "created_at": "2020-09-23T17:36:43.634Z",
            "updated_at": "2020-09-23T17:36:43.634Z"
         },
```

  ***8.2.2 Visualizando estudante específico: GET api/v1/students/1***

>   Parâmetros: id do estudante

>   Retorno: 

```json
{
    "message": "Student 5 loaded.",
    "data": {
        "id": 5,
        "name": "Estudante A",
        "cpf": "984.044.797-71",
        "birth_date": "2001-04-10",
        "phone": 116469569,
        "gender": "F",
        "pay_method": "Cartão",
        "cep": "18051730",
        "address": "Rua Darcy Rocha",
        "state": "SP",
        "neighborhood": "Jardim Piazza di Roma",
        "city": "Sorocaba",
        "enabled_std": "true",
        "created_at": "2020-09-23T17:36:44.081Z",
        "updated_at": "2020-09-23T17:36:44.081Z"
    }
}
```

  ***8.2.3 Criando estudante: POST api/v1/students***

>   Parâmetros: nome, cpf, gênero e meio de pagamento das faturas 

>   Requisição

```json
{
        "name": "João",
        "cpf": "12345678910",
        "gender": "M",
        "pay_method": "Cartão",
        "birth_date": "2000-12-07",
        "phone": 998804342,
        "cep": "69900487"
}
```

>  Retorno: 

```json
{
    "message": "Student registered.",
    "data": {
        "id": 3,
        "name": "João",
        "cpf": "123.456.789-10",
        "birth_date": "2000-12-07",
        "phone": 998804342,
        "gender": "M",
        "pay_method": "Cartão",
        "cep": "69900487",
        "address": "Rua Manoel Barata",
        "state": "AC",
        "neighborhood": "Bosque",
        "city": "Rio Branco",
        "enabled_std": "true",
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
        "pay_method": "Boleto",
        "phone": 822398342
}
```

>   Resposta:

```json
{
    "message": "Student 3 updated.",
    "data": {
        "id": 3,
        "name": "Aluno 1",
        "cpf": "123.456.789-10",
        "birth_date": "2000-12-07",
        "phone": 822398342,
        "gender": "M",
        "pay_method": "Boleto",
        "cep": "69900487",
        "address": "Rua Manoel Barata",
        "state": "AC",
        "neighborhood": "Bosque",
        "city": "Rio Branco",
        "enabled_std": "true",
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
    "message": "Student 10 deleted",
    "data": {
        "id": 10,
        "name": "Estudante 10",
        "cpf": "554.469.075-12",
        "birth_date": "1998-01-19",
        "phone": 599955516,
        "gender": "F",
        "pay_method": "Cartão",
        "cep": "76901050",
        "address": "Rua São Manoel",
        "state": "RO",
        "neighborhood": "Jardim Presidencial",
        "city": "Ji-Paraná",
        "enabled_std": "false",
        "created_at": "2020-09-24T18:25:55.870Z",
        "updated_at": "2020-09-24T18:25:55.870Z"
    }
}
```