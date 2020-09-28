#### 8.1 Instituições

  ***8.1.1 Visualizando todas as instituições: GET api/v1/institutions***

>   Retorno:

```json
"status": "SUCESSO",
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


  ***8.1.2 Visualizando instituição específica: GET api/v1/institutions/1***

>   Parâmetros: id da instituição 

>   Retorno: 

```json
"status": "SUCESSO",
    "message": "Instituição de Ensino 1 Carregada.",
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

  ***8.1.3 Criando instituição: POST api/v1/institutions***

>   Parâmetros: Nome e tipo

>   Requisição

```json
{
        "nome": "Universidade 2",
        "cnpj": "00000000000000",
        "tipo": "Universidade"
}
```
>   Retorno:

```json
{
    "status": "SUCESSO",
    "message": "Universidade 2 Cadastrada.",
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
    "status": "SUCESSO",
    "message": "Instituição 3 Atualizada.",
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

  ***8.2.5 Deletando uma instituição: DELETE api/v1/institutions/10***

>   Parâmetros: id da instituição
>   Obs: A exclusão de uma instituição exclui também todas as matrículas e faturas vinculadas a ela.

>   Retorno:

```json
{
    "status": "SUCESSO",
    "message": "Instituição 4 deletada",
    "data": {
        "id": 4,
        "nome": "Creche 4",
        "cnpj": "24450024209805",
        "tipo": "Creche",
        "created_at": "2020-09-24T18:25:53.714Z",
        "updated_at": "2020-09-24T18:25:53.714Z"
    }
}
```