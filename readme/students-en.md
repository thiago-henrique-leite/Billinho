#### 8.2 Estudantes

  ***8.2.1 Viewing all students: GET api/v1/students***

>   Response:

```json
{
    "message": "All students loaded.",
    "data": [
        {
            "id": 1,
            "name": "Student 1",
            "cpf": "98404479771",
            "birth_date": "2001-04-10",
            "phone": 116469569,
            "gender": "F",
            "pay_method": "Cartão",
            "created_at": "2020-09-23T17:36:43.628Z",
            "updated_at": "2020-09-23T17:36:43.628Z"
        },
        {
            "id": 2,
            "name": "Student 2",
            "cpf": "75211848308",
           "birth_date": "1995-07-24",
            "phone": 874784207,
            "gender": "M",
            "pay_method": "Boleto",
            "created_at": "2020-09-23T17:36:43.634Z",
            "updated_at": "2020-09-23T17:36:43.634Z"
         },
```

  ***8.2.2 Viewing specific student: GET api/v1/students/1***

>   Parameters: Student ID

>   Response: 

```json
{
    "message": "Student 5 loaded.",
    "data": {
        "id": 5,
        "name": "Student A",
        "cpf": "98404479771",
        "birth_date": "2001-04-10",
        "phone": 116469569,
        "gender": "F",
        "pay_method": "Cartão",
        "created_at": "2020-09-23T17:36:44.081Z",
        "updated_at": "2020-09-23T17:36:44.081Z"
    }
}
```

  ***8.2.3 Creating student: POST api/v1/students***

>   Parameters: name, cpf, gender and bill payment method 

>   Request

```json
{
        "name": "John",
        "cpf": "12345678910",
        "gender": "M",
        "pay_method": "Cartão",
        "birth_date": "2000-12-07",
        "phone": 998804342
}
```

>  Response: 

```json
{
    "message": "Student registered.",
    "data": {
        "id": 3,
        "name": "John",
        "cpf": "12345678910",
        "birth_date": "2000-12-07",
        "phone": 998804342,
        "gender": "M",
        "pay_method": "Cartão",
        "created_at": "2020-09-23T22:39:13.899Z",
        "updated_at": "2020-09-23T22:39:13.899Z"
    }
}
```

  ***8.2.4 Updating student: PUT api/v1/students/3***

>   Parameters: Student ID

>   In the request, put only the field you want to update.

>   Request:

```json
{
        "pay_method": "Boleto",
        "phone": 822398342
}
```

>   Response:

```json
{
    "message": "Student 3 updated.",
    "data": {
        "id": 3,
        "name": "John",
        "cpf": "12345678910",
        "birth_date": "2000-12-07",
        "phone": 822398342,
        "gender": "M",
        "pay_method": "Boleto",
        "created_at": "2020-09-23T22:39:13.899Z",
        "updated_at": "2020-09-23T22:39:13.899Z"
    }
}
```

  ***8.2.5 Deleting a student: DELETE api/v1/students/10***

>   Parameters: Student ID
>   Note: Deleting a student also deletes all enrollments and bills linked to the student.

>   Response:

```json
{
    "message": "Student 10 deleted",
    "data": {
        "id": 10,
        "name": "Student 10",
        "cpf": "55446907512",
        "birth_date": "1998-01-19",
        "phone": 599955516,
        "gender": "F",
        "pay_method": "Cartão",
        "created_at": "2020-09-24T18:25:55.870Z",
        "updated_at": "2020-09-24T18:25:55.870Z"
    }
}
```