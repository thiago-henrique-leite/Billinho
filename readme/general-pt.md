# Funcionamento da API

#### 8.1 Instituições

  ***8.1.1 Visualizando todas as instituições: GET api/v1/institutions***

>   Retorno:

```json
{
    "message": "Educational Institutions loaded.",
    "data": [
        {
            "id": 1,
            "name": "Escola 1",
            "cnpj": "60.392.739/8751-45",
            "kind": "Escola",
            "cep": "76901050",
            "address": "Rua São Manoel",
            "state": "RO",
            "neighborhood": "Jardim Presidencial",
            "city": "Ji-Paraná",
            "created_at": "2020-09-23T17:36:41.328Z",
            "updated_at": "2020-09-23T17:36:41.328Z"
        },
        {
            "id": 2,
            "name": "Universidade 1",
            "cnpj": "95.014.120/2129-17",
            "kind": "Universidade",
            "cep": "58037305",
            "address": "Rua Lindolfo José Correia das Neves",
            "state": "PB",
            "neighborhood": "Jardim Oceania",
            "city": "João Pessoa",
            "created_at": "2020-09-23T17:36:41.333Z",
            "updated_at": "2020-09-23T17:36:41.333Z"
        },

```


  ***8.1.2 Visualizando instituição específica: GET api/v1/institutions/1***

>   Parâmetros: id da instituição 

>   Retorno: 

```json
{
    "message": "Educational Institution 1 loaded.",
    "data": [
        {
            "id": 1,
            "name": "Escola 1",
            "cnpj": "60.392.739/8751-45",
            "kind": "Escola",
            "cep": "76901050",
            "address": "Rua São Manoel",
            "state": "RO",
            "neighborhood": "Jardim Presidencial",
            "city": "Ji-Paraná",
            "created_at": "2020-09-23T17:36:41.328Z",
            "updated_at": "2020-09-23T17:36:41.328Z"
        }
```

  ***8.1.3 Criando instituição: POST api/v1/institutions***

>   Parâmetros: name, kind, cep, cnpj

>   Requisição

```json
{
        "name": "Universidade 2",
        "cnpj": "72727640000109",
        "kind": "Universidade",
        "cep": "76829374"
}
```
>   Retorno:

```json
{
    "message": "Universidade 2 registered.",
    "data": {
        "id": 3,
        "name": "Universidade 2",
        "cnpj": "72.727.640/0001-09",
        "kind": "Universidade",
        "cep": "76829374",
        "address": "Rua Professora Dolly Carvalho",
        "state": "RO",
        "neighborhood": "Juscelino Kubitschek",
        "city": "Porto Velho",
        "created_at": "2020-09-23T22:00:21.337Z",
        "updated_at": "2020-09-23T22:00:21.337Z"
    }
}
```

  ***8.1.4 Atualizando instituição: PUT api/v1/institutions/3***

>   Parâmetros: id da instituição

>   Na requisição colocar apenas o campo que quer atualizar.

>   Requisição:

```json
{
        "cnpj": "18899965478530"
}
```
>   Retorno

```json
{
    "message": "Institution 3 updated.",
    "data": {
        "id": 3,
        "name": "Universidade 2",
        "cnpj": "18.899.965/4785-30",
        "kind": "Universidade",
        "cep": "76829374",
        "address": "Rua Professora Dolly Carvalho",
        "state": "RO",
        "neighborhood": "Juscelino Kubitschek",
        "city": "Porto Velho",
        "created_at": "2020-09-23T22:00:21.337Z",
        "updated_at": "2020-09-23T22:00:21.337Z"
    }
}
```

  ***8.2.5 Deletando uma instituição: DELETE api/v1/institutions/10***

>   Parâmetros: id da instituição
>   Obs: A exclusão de uma instituição exclui também todas as matrículas e faturas vinculadas a ela.

>   Retorno:

```json
{
    "message": "Institution 4 deleted",
    "data": {
        "id": 4,
        "name": "Creche 4",
        "cnpj": "24.450.024/2098-05",
        "kind": "Creche",
        "address": "Praia São Francisco",
        "state": "PA",
        "neighborhood": "São Francisco (Mosqueiro)",
        "city": "Belém",
        "created_at": "2020-09-24T18:25:53.714Z",
        "updated_at": "2020-09-24T18:25:53.714Z"
    }
}
```

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
        "created_at": "2020-09-23T17:36:44.081Z",
        "updated_at": "2020-09-23T17:36:44.081Z"
    }
}
```

  ***8.2.3 Criando estudante: POST api/v1/students***

>   Parâmetros: name, cpf, gênero e meio de pagamento das faturas 

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
        "created_at": "2020-09-24T18:25:55.870Z",
        "updated_at": "2020-09-24T18:25:55.870Z"
    }
}
```

#### 8.3 Matrículas

  ***8.3.1 Visualizando todas as matrículas: GET api/v1/enrollments***

>   Resposta: 

```json
{
    "message": "All enrollments loaded.",
    "data": [
        {
            "id": 1,
            "total_value": "759.45",
            "ammount_bills": 30,
            "due_day": 7,
            "course": "course 0",
            "institution_id": 1,
            "student_id": 2,
            "created_at": "2020-09-23T17:36:46.033Z",
            "updated_at": "2020-09-23T17:36:46.033Z"
        },
        {
            "id": 2,
            "total_value": "433.57",
            "ammount_bills": 60,
            "due_day": 29,
            "course": "course 1",
            "institution_id": 2,
            "student_id": 1,
            "created_at": "2020-09-23T17:36:46.064Z",
            "updated_at": "2020-09-23T17:36:46.064Z"
        },
```

  ***8.3.2 Visualizando matrícula específica: GET api/v1/enrollments/2***

>   Parâmetros: id da matrícula

>   Resposta:

```json
{
    "message": "Enrollment 2 loaded.",
    "data": {
        "id": 2,
        "total_value": "433.57",
        "ammount_bills": 60,
        "due_day": 29,
        "course": "course 1",
        "institution_id": 2,
        "student_id": 1,
        "created_at": "2020-09-23T17:36:46.064Z",
        "updated_at": "2020-09-23T17:36:46.064Z"
    }
}
```

  ***8.3.3 Visualizando todas as matrículas de uma instituição específica: GET api/v1/institutions/3/enrollments***

>   Parâmetros: id da instituição

>   Observação: É possível ainda visualizar todas as matrículas de um estudante GET api/v1/students/3/enrollments

>   Resposta:

```json
{
    "message": "Enrollments of institution 3 loaded.",
    "data": [
        {
            "id": 4,
            "total_value": "874.99",
            "ammount_bills": 24,
            "due_day": 30,
            "course": "course 42",
            "institution_id": 3,
            "student_id": 79,
            "created_at": "2020-09-23T17:36:46.064Z",
            "updated_at": "2020-09-23T17:36:46.064Z"
        },
        {
            "id": 15,
            "total_value": "1230.0",
            "ammount_bills": 32,
            "due_day": 5,
            "course": "course 68",
            "institution_id": 3,
            "student_id": 156,
            "created_at": "2020-09-23T17:36:46.064Z",
            "updated_at": "2020-09-23T17:36:46.064Z"
        }
    ]
}
```

  ***8.3.4 Criando matrícula: POST api/v1/enrollments***

>   Parâmetros: id da instituição, id do estudante, valor total do course, quantidade de faturas,
>   dia do vencimento da fatura e name do course.

>   Requisição:

```json
{
        "institution_id": 325,
        "student_id": 200,
        "total_value": 256000,
        "ammount_bills": 60,
        "due_day": 15,
        "course": "Ciência da Computação"
}
```

>   Resposta

```json
{
    "message": "Enrollment registered.",
    "data": {
        "id": 615,
        "total_value": "256000.0",
        "ammount_bills": 60,
        "due_day": 15,
        "course": "Ciência da Computação",
        "institution_id": 325,
        "student_id": 200,
        "created_at": "2020-09-24T12:23:01.428Z",
        "updated_at": "2020-09-24T12:23:01.428Z"
    }
}
```

 ***8.3.5 Atualizando matrícula: POST api/v1/enrollments/3***

>   Parâmetros: name do course ou id da instituição.

>   Requisição:

```json
{
        "course": "Arquitetura"
}
```

> Retorno:

```json
{
    {
    "message": "Enrollment 3 updated.",
    "data": {
        "id": 3,
        "course": "Arquitetura",
        "institution_id": 3,
        "student_id": 3,
        "total_value": "1247.95",
        "ammount_bills": 60,
        "due_day": 2,
        "created_at": "2020-09-25T13:24:01.941Z",
        "updated_at": "2020-09-25T14:38:05.648Z"
    }
}
```

 ***8.3.6 Deletando uma matrícula: DELETE api/v1/enrollments/10***

>   Parâmetros: id da matrícula </br>
>   Obs: A exclusão de uma matrícula exclui também todas as faturas vinculadas àquela matrícula.

>   Retorno:

```json
{
    "message": "Enrollment 10 deleted.",
    "data": {
        "id": 10,
        "total_value": "714.85",
        "ammount_bills": 4,
        "due_day": 22,
        "course": "course 10",
        "institution_id": 10,
        "student_id": 10,
        "created_at": "2020-09-24T18:25:58.308Z",
        "updated_at": "2020-09-24T18:25:58.308Z"
    }
}
```


#### 8.4 Faturas

  ***8.4.1 Visualizando todas as faturas: GET api/v1/bills***

>   Resposta: 

```json
{
    "message": "All bills loaded.",
    "data": [
        {
            "id": 1,
            "bill_amount": "654.54",
            "due_date": "2020-10-07",
            "enrollment_id": 21,
            "status": "Aberta",
            "student_id": 63,
            "created_at": "2020-09-23T17:36:46.052Z",
            "updated_at": "2020-09-23T17:36:46.052Z"
        },
        {
            "id": 2,
            "bill_amount": "777.69",
            "due_date": "2020-11-07",
            "enrollment_id": 21,
            "status": "Paga",
            "student_id": 63,
            "created_at": "2020-09-23T17:36:46.056Z",
            "updated_at": "2020-09-23T17:36:46.056Z"
        },
```

  ***8.4.2 Visualizando fatura específica: GET api/v1/bills/407***

>   Resposta: 

```json
{
    "message": "Bill 407 loaded.",
    "data": {
        "id": 407,
        "bill_amount": "379.73",
        "due_date": "2020-10-07",
        "enrollment_id": 115,
        "status": "Aberta",
        "student_id": 42,
        "created_at": "2020-09-23T17:36:46.052Z",
        "updated_at": "2020-09-23T17:36:46.052Z"
    }
}
```

  ***8.4.3 Visualizando todas as faturas de uma matrícula específica: GET api/v1/enrollments/3/bills***

>   Parâmetros: id da fatura

>   Observação: É possível ainda visualizar tofas as faturas de um estudante: GET api/v1/students/4/bills

>   Resposta: 

```json
{
    "message": "Bills of enrollment 115 loaded.",
    "data": [
        {
            "id": 407,
            "bill_amount": "379.73",
            "due_date": "2020-10-07",
            "enrollment_id": 115,
            "status": "Aberta",
            "student_id": 42,
            "created_at": "2020-09-23T17:36:46.052Z",
            "updated_at": "2020-09-23T17:36:46.052Z"
        },
        {
            "id": 408,
            "bill_amount": "379.73",
            "due_date": "2020-11-07",
            "enrollment_id": 115,
            "status": "Aberta",
            "student_id": 85,
            "created_at": "2020-09-23T17:36:46.056Z",
            "updated_at": "2020-09-23T17:36:46.056Z"
        }
    ]
}
```

  ***8.4.4 Criando faturas***

>   A criação de faturas é um pouco diferente do restante, elas são criadas juntamente com a matrícula. O sistema cria o número correto de faturas de acordo com o valor do campo Quantidade de faturas da matrícula criada. Para definir o valor de cada fatura basta dividir o Valor total do course em reais pela Quantidade de faturas, ambos valores pertencentes à matrícula. 

> Na definição da data de vencimento, caso o dia de vencimento recebido seja menor ou igual ao dia do mês atual, as faturas devem iniciar no próximo mês, caso contrário, devem iniciar no mês atual. Por exemplo, hoje sendo dia 01/10/2020 e o dia de vencimento igual a 30, a data de vencimento da primeira fatura deve ser 30/10/2020, as datas de vencimento das demais faturas devem ser sempre no mês seguinte da anterior:      

>   Hoje sendo 01/10/2020

>   Com os seguintes dados da matrícula:

  Valor total do course | Quantidade | Dia de vencimento | ID da Instiuição | ID do aluno
  ---------------------|------------|-------------------|------------------|-------------
  2000.00              |     5      |        30         |        1         |      1

>   Assumimos que tanto a instituição de ensino, quanto o aluno já foram criados anteriormente)

>   Obs: Quando o mês não possui o número de dias da data de vencimento da fatura, ela passa a vencer no dia 01 do próximo mês.

>   Neste contexto deverão ser criadas 5 faturas, cada uma com o valor de R$ 400,00, com as seguintes datas de vencimento:

>   - 30/10/2020
>   - 30/11/2020
>   - 30/12/2020
>   - 30/01/2020
>   - 01/03/2020

  ***8.4.5 Atualizando status da fatura: PUT api/v1/bills/420***

>   Parâmetros: id da fatura e novo status da fatura

>   Requisição:

```json
{       
        "status": "Atrasada"
}
```

>   Resposta:

```json
{
    "message": "Bill 410 updated.",
    "data": {
        "id": 410,
        "status": "Atrasada",
        "enrollment_id": 116,
        "bill_amount": "108.39",
        "due_date": "2020-10-29",
        "student_id": 91,
        "created_at": "2020-09-23T17:36:46.072Z",
        "updated_at": "2020-09-24T12:43:23.244Z"
    }
}
```
  ***8.4.6 Deletando uma faturas: DELETE api/v1/bills/10***

>   Parâmetros: id da fatura

>   Retorno:

```json
{
    "message": "Bill 10 deleted.",
    "data": {
        "id": 10,
        "bill_amount": "242.17",
        "due_date": "2020-10-30",
        "enrollment_id": 3,
        "status": "Aberta",
        "student_id": 3,
        "created_at": "2020-09-24T18:25:58.195Z",
        "updated_at": "2020-09-24T18:25:58.195Z"
    }
}
```
