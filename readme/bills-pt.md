#### 8.4 Faturas

  ***8.4.1 Visualizando todas as faturas: GET api/v1/bills***

>   Resposta: 

```json
{
    "message": "All bills loaded.",
    "data": [
        {
            "id": 1,
            "bill_value": "654.54",
            "due_date": "2020-10-07",
            "enrollment_id": 21,
            "status": "open",
            "student_id": 63,
            "institution_id": 63,
            "enabled_bill": "true",
            "created_at": "2020-09-23T17:36:46.052Z",
            "updated_at": "2020-09-23T17:36:46.052Z"
        },
        {
            "id": 2,
            "bill_value": "777.69",
            "due_date": "2020-11-07",
            "enrollment_id": 21,
            "status": "paid",
            "student_id": 64,
            "institution_id": 64,
            "enabled_bill": "true",
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
        "bill_value": "379.73",
        "due_date": "2020-10-07",
        "enrollment_id": 115,
        "status": "open",
        "student_id": 42,
        "institution_id": 24,
        "enabled_bill": "true",
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
            "bill_value": "379.73",
            "due_date": "2020-10-07",
            "enrollment_id": 115,
            "status": "open",
            "student_id": 42,
            "institution_id": 24,
            "enabled_bill": "true",
            "created_at": "2020-09-23T17:36:46.052Z",
            "updated_at": "2020-09-23T17:36:46.052Z"
        },
        {
            "id": 408,
            "bill_value": "379.73",
            "due_date": "2020-11-07",
            "enrollment_id": 115,
            "status": "open",
            "student_id": 85,
            "institution_id": 83,
            "enabled_bill": "true",
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

  Valor total do curso | Quantidade | Dia de vencimento | ID da Instiuição | ID do aluno
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
        "status": "pending"
}
```

>   Resposta:

```json
{
    "message": "Bill 410 updated.",
    "data": {
        "id": 410,
        "status": "pending",
        "enrollment_id": 116,
        "bill_value": "108.39",
        "due_date": "2020-10-29",
        "student_id": 91,
        "institution_id": 67,
        "enabled_bill": "true",
        "created_at": "2020-09-23T17:36:46.072Z",
        "updated_at": "2020-09-24T12:43:23.244Z"
    }
}
```
  ***8.4.6 Deletando uma faturas: DELETE api/v1/bills/10***

>   Parâmetros: id da fatura

>   Obs: Ao deletar uma fatura, os campos quantidade de faturas e valor total do curso 
da matrícula em questão é descrementado.

>   Retorno:

```json
{
    "message": "Bill 10 deleted.",
    "data": {
        "id": 10,
        "bill_value": "242.17",
        "due_date": "2020-10-30",
        "enrollment_id": 3,
        "status": "open",
        "student_id": 3,
        "institution_id": 12,
        "enabled_bill": "false",
        "created_at": "2020-09-24T18:25:58.195Z",
        "updated_at": "2020-09-24T18:25:58.195Z"
    }
}
```
