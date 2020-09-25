#### 8.3 Matrículas

  ***8.3.1 Visualizando todas as matrículas: GET api/v1/enrollments***

>   Resposta: 

```json
{
    "status": "SUCCESSO",
    "message": "Todas as matrículas Carregadas.",
    "data": [
        {
            "id": 1,
            "valor_total": "759.45",
            "quant_faturas": 30,
            "dia_vencimento": 7,
            "curso": "Curso 0",
            "institution_id": 1,
            "student_id": 2,
            "created_at": "2020-09-23T17:36:46.033Z",
            "updated_at": "2020-09-23T17:36:46.033Z"
        },
        {
            "id": 2,
            "valor_total": "433.57",
            "quant_faturas": 60,
            "dia_vencimento": 29,
            "curso": "Curso 1",
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
    "status": "SUCCESSO",
    "message": "Matrícula 2 Carregada.",
    "data": {
        "id": 2,
        "valor_total": "433.57",
        "quant_faturas": 60,
        "dia_vencimento": 29,
        "curso": "Curso 1",
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
    "status": "SUCCESSO",
    "message": "Matrículas da Instituição 3 Carregadas.",
    "data": [
        {
            "id": 4,
            "valor_total": "874.99",
            "quant_faturas": 24,
            "dia_vencimento": 30,
            "curso": "Curso 42",
            "institution_id": 3,
            "student_id": 79,
            "created_at": "2020-09-23T17:36:46.064Z",
            "updated_at": "2020-09-23T17:36:46.064Z"
        },
        {
            "id": 15,
            "valor_total": "1230.0",
            "quant_faturas": 32,
            "dia_vencimento": 5,
            "curso": "Curso 68",
            "institution_id": 3,
            "student_id": 156,
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
        "valor_total": 256000,
        "quant_faturas": 60,
        "dia_vencimento": 15,
        "curso": "Ciência da Computação"
}
```

>   Resposta

```json
{
    "status": "SUCCESSO",
    "message": "Matrícula Cadastrada.",
    "data": {
        "id": 615,
        "valor_total": "256000.0",
        "quant_faturas": 60,
        "dia_vencimento": 15,
        "curso": "Ciência da Computação",
        "institution_id": 325,
        "student_id": 200,
        "created_at": "2020-09-24T12:23:01.428Z",
        "updated_at": "2020-09-24T12:23:01.428Z"
    }
}
```

 ***8.3.5 Atualizando matrícula: POST api/v1/enrollments/3***

>   Parâmetros: Nome do curso ou id da instituição.

>   Requisição:

```json
{
        "curso": "Arquitetura"
}
```

> Retorno:

```json
{
    "status": "SUCCESSO",
    "message": "Matrícula 3 Atualizada.",
    "data": {
        "id": 3,
        "curso": "Arquitetura",
        "institution_id": 3,
        "student_id": 3,
        "valor_total": "1247.95",
        "quant_faturas": 60,
        "dia_vencimento": 2,
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
    "status": "SUCCESSO",
    "message": "Matrícula 10 Deletada.",
    "data": {
        "id": 10,
        "valor_total": "714.85",
        "quant_faturas": 4,
        "dia_vencimento": 22,
        "curso": "Curso 10",
        "institution_id": 10,
        "student_id": 10,
        "created_at": "2020-09-24T18:25:58.308Z",
        "updated_at": "2020-09-24T18:25:58.308Z"
    }
}
```
