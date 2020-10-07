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
            "amount_bills": 30,
            "due_day": 7,
            "course": "Curso 0",
            "institution_id": 1,
            "student_id": 2,
            "enabled_enr": "true",
            "created_at": "2020-09-23T17:36:46.033Z",
            "updated_at": "2020-09-23T17:36:46.033Z"
        },
        {
            "id": 2,
            "total_value": "433.57",
            "amount_bills": 60,
            "due_day": 29,
            "course": "Curso 1",
            "institution_id": 2,
            "student_id": 1,
            "enabled_enr": "true",
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
        "amount_bills": 60,
        "due_day": 29,
        "course": "Curso 1",
        "institution_id": 2,
        "student_id": 1,
        "enabled_enr": "true",
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
            "amount_bills": 24,
            "due_day": 30,
            "course": "Curso 42",
            "institution_id": 3,
            "student_id": 79,
            "enabled_enr": "true",
            "created_at": "2020-09-23T17:36:46.064Z",
            "updated_at": "2020-09-23T17:36:46.064Z"
        },
        {
            "id": 15,
            "total_value": "1230.0",
            "amount_bills": 32,
            "due_day": 5,
            "course": "Curso 68",
            "institution_id": 3,
            "student_id": 156,
            "enabled_enr": "true",
            "created_at": "2020-09-23T17:36:46.064Z",
            "updated_at": "2020-09-23T17:36:46.064Z"
        }
    ]
}
```

  ***8.3.4 Criando matrícula: POST api/v1/enrollments***

>   Parâmetros: id da instituição, id do estudante, valor total do curso, quantidade de faturas,
>   dia do vencimento da fatura e nome do curso.

>   Requisição:

```json
{
        "institution_id": 325,
        "student_id": 200,
        "total_value": 256000,
        "amount_bills": 60,
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
        "amount_bills": 60,
        "due_day": 15,
        "course": "Ciência da Computação",
        "institution_id": 325,
        "student_id": 200,
        "enabled_enr": "true",
        "created_at": "2020-09-24T12:23:01.428Z",
        "updated_at": "2020-09-24T12:23:01.428Z"
    }
}
```

 ***8.3.5 Atualizando matrícula: POST api/v1/enrollments/3***

>   Parâmetros: Colocar o campo que quer atualizar.

>   Obs: Ao atualizar uma matrícula, todas as faturas vinculadas a ela são desabilitadas
e são criadas novas mensalidades com os valores atualizados.

>   Requisição:

```json
{
        "course": "Arquitetura"
}
```

> Retorno:

```json
{
    "message": "Enrollment 3 updated.",
    "data": {
        "id": 3,
        "course": "Arquitetura",
        "institution_id": 3,
        "student_id": 3,
        "total_value": "1247.95",
        "amount_bills": 60,
        "due_day": 2,
        "enabled_enr": "true",
        "created_at": "2020-09-25T13:24:01.941Z",
        "updated_at": "2020-09-25T14:38:05.648Z"
    }
}
```

 ***8.3.6 Deletando uma matrícula: DELETE api/v1/enrollments/10***

>   Parâmetros: id da matrícula 

>   Obs: A exclusão de uma matrícula exclui também todas as faturas vinculadas àquela matrícula.

>   Retorno:

```json
{
    "message": "Enrollment 10 deleted.",
    "data": {
        "id": 10,
        "total_value": "714.85",
        "amount_bills": 4,
        "due_day": 22,
        "course": "Curso 10",
        "institution_id": 10,
        "student_id": 10,
        "enabled_enr": "false",
        "created_at": "2020-09-24T18:25:58.308Z",
        "updated_at": "2020-09-24T18:25:58.308Z"
    }
}
```