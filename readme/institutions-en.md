#### 8.1 Institutions

  ***8.1.1 Viewing all institutions: GET api/v1/institutions***

>   Response:

```json
{
    "message": "Educational Institutions loaded.",
    "data": [
        {
            "id": 1,
            "name": "School 1",
            "cnpj": "60392739875145",
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
            "name": "University 1",
            "cnpj": "95014120212917",
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


  ***8.1.2 Viewing specific institution: GET api/v1/institutions/1***

>   Parameters: Institution ID

>   Response: 

```json
{
    "message": "Educational Institution 1 loaded.",
    "data": [
        {
            "id": 1,
            "name": "School 1",
            "cnpj": "60392739875145",
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

  ***8.1.3 Creating institution: POST api/v1/institutions***

>   Parameters: Name and kind

>   Request:

```json
{
        "name": "University 2",
        "cnpj": "72727640000109",
        "kind": "Universidade",
        "cep": "76829374"
}
```
>   Response:

```json
{
    "message": "University 2 registered.",
    "data": {
        "id": 3,
        "name": "University 2",
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

  ***8.1.4 Updating institution: PUT api/v1/institutions/3***

>   Parameters: Institution ID

>   In the request, put only the field you want to update.

>   Request:

```json
{
        "cnpj": "18899965478530"
}
```
>   Response

```json
{
    "message": "Institution 3 updated.",
    "data": {
        "id": 3,
        "name": "University 2",
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

  ***8.2.5 Deleting a institution: DELETE api/v1/institutions/10***

>   Parameters: Institution ID
>   Note: The exclusion of an institution also excludes all enrollments and bills linked to it.

>   Response:

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