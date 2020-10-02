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
            "cnpj": "60392739875145",
            "kind": "Escola",
            "created_at": "2020-09-23T17:36:41.328Z",
            "updated_at": "2020-09-23T17:36:41.328Z"
        },
        {
            "id": 2,
            "name": "Universidade 1",
            "cnpj": "95014120212917",
            "kind": "Universidade",
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
            "cnpj": "60392739875145",
            "kind": "Escola",
            "created_at": "2020-09-23T17:36:41.328Z",
            "updated_at": "2020-09-23T17:36:41.328Z"
        }
```

  ***8.1.3 Criando instituição: POST api/v1/institutions***

>   Parâmetros: name e kind

>   Requisição

```json
{
        "name": "Universidade 2",
        "cnpj": "00000000000000",
        "kind": "Universidade"
}
```
>   Retorno:

```json
{
    "message": "Universidade 2 registered.",
    "data": {
        "id": 3,
        "name": "Universidade 2",
        "cnpj": "00000000000000",
        "kind": "Universidade",
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
        "cnpj": "18899965478530",
        "kind": "Universidade",
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
        "cnpj": "24450024209805",
        "kind": "Creche",
        "created_at": "2020-09-24T18:25:53.714Z",
        "updated_at": "2020-09-24T18:25:53.714Z"
    }
}
```