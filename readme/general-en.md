# API Operation

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

#### 8.2 Students

  ***8.2.1 Viewing all students: GET api/v1/students***

>   Response:

```json
{
    "message": "All students loaded.",
    "data": [
        {
            "id": 1,
            "name": "Student 1",
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
            "name": "Student 2",
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

  ***8.2.2 Viewing specific student: GET api/v1/students/1***

>   Parameters: Student ID

>   Response: 

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
        "phone": 998804342,
        "cep": "69900487"
}
```

>  Response: 

```json
{
    "message": "Student registered.",
    "data": {
        "id": 3,
        "name": "John",
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

#### 8.3 Enrollments

  ***8.3.1 Viewing all enrollments: GET api/v1/enrollments***

>   Response: 

```json
{
    "message": "All enrollments loaded.",
    "data": [
        {
            "id": 1,
            "total_value": "759.45",
            "ammount_bills": 30,
            "due_day": 7,
            "course": "Course 0",
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
            "course": "Course 1",
            "institution_id": 2,
            "student_id": 1,
            "created_at": "2020-09-23T17:36:46.064Z",
            "updated_at": "2020-09-23T17:36:46.064Z"
        },
```

  ***8.3.2 Viewing specific enrollment: GET api/v1/enrollments/2***

>   Parameters: Enrollment ID

>   Response:

```json
{
    "message": "Enrollment 2 loaded.",
    "data": {
        "id": 2,
        "total_value": "433.57",
        "ammount_bills": 60,
        "due_day": 29,
        "course": "Course 1",
        "institution_id": 2,
        "student_id": 1,
        "created_at": "2020-09-23T17:36:46.064Z",
        "updated_at": "2020-09-23T17:36:46.064Z"
    }
}
```

  ***8.3.3 Viewing all enrollments for a specific institution: GET api/v1/institutions/3/enrollments***

>   Parameters: Institution ID

>   Observação: You can also view all enrollments for a student GET api/v1/students/3/enrollments

>   Response:

```json
{
    "message": "Enrollments of institution 3 loaded.",
    "data": [
        {
            "id": 4,
            "total_value": "874.99",
            "ammount_bills": 24,
            "due_day": 30,
            "course": "Course 42",
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
            "course": "Course 68",
            "institution_id": 3,
            "student_id": 156,
            "created_at": "2020-09-23T17:36:46.064Z",
            "updated_at": "2020-09-23T17:36:46.064Z"
        }
    ]
}
```

  ***8.3.4 Creating Enrollment: POST api/v1/enrollments***

>   Parameters: Institution ID, Student ID, total course value, number of bills,
>   bill due day and course name.

>   Request:

```json
{
        "institution_id": 325,
        "student_id": 200,
        "total_value": 256000,
        "ammount_bills": 60,
        "due_day": 15,
        "course": "Computer Science"
}
```

>   Response

```json
{
    "message": "Enrollment registered.",
    "data": {
        "id": 615,
        "total_value": "256000.0",
        "ammount_bills": 60,
        "due_day": 15,
        "course": "Computer Science",
        "institution_id": 325,
        "student_id": 200,
        "created_at": "2020-09-24T12:23:01.428Z",
        "updated_at": "2020-09-24T12:23:01.428Z"
    }
}
```

 ***8.3.5 Updating Enrollment: POST api/v1/enrollments/3***

>   Allowed parameters: Course name or institution id.

>   Request:

```json
{
        "course": "Architecture"
}
```

> Request:

```json
{
    "message": "Enrollment 3 updated.",
    "data": {
        "id": 3,
        "course": "Architecture",
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

 ***8.3.6 Deleting a enrollment: DELETE api/v1/enrollments/10***

>   Parameters: Enrollment ID </br>
>   Note: Deleting a enrollment also excludes all bills linked to that enrollment.

>   Request:

```json
{
    "message": "Enrollment 10 deleted.",
    "data": {
        "id": 10,
        "total_value": "714.85",
        "ammount_bills": 4,
        "due_day": 22,
        "course": "Course 10",
        "institution_id": 10,
        "student_id": 10,
        "created_at": "2020-09-24T18:25:58.308Z",
        "updated_at": "2020-09-24T18:25:58.308Z"
    }
}
```

#### 8.4 Bills

  ***8.4.1 Viewing all bills: GET api/v1/bills***

>   Response: 

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

  ***8.4.2 Viewing specific bill: GET api/v1/bills/407***

>   Response: 

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

  ***8.4.3 Viewing all bills for a specific enrollment: GET api/v1/enrollments/3/bills***

>   Parameters: Bill Id

>   Note: You can also view all student bills: GET api/v1/students/4/bills

>   Response: 

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

  ***8.4.4 Creating bills***

>   The creation of bills is a little different from the rest, they are created together with the enrollment. The system creates the correct number of bills according to the value of the Number of bills field in the created enrollment. To define the value of each bill, just divide the total amount of the course in reais by the Quantity of bills, both values belonging to the enrollment.

>   In defining the due date, if the due date received is less than or equal to the day of the current month, invoices must start in the next month, otherwise, they must start in the current month. For example, today being 10/1/2020 and the due day equal to 30, the due date of the first invoice must be 10/30/2020, the due dates of the other invoices must always be in the month following the previous one:      

>   Today being 10/01/2020

>   With the following enrollment data:

  Total course value   |   Amount   | Due day  | Institution ID  | Student ID 
  ---------------------|------------|----------|-----------------|------------
  2000.00              |     5      |    30    |        1        |     1

>   We assume that both the educational institution and the student have been created previously.

>   Note: When the month does not have the number of days from the bills due day, it starts to expire on the 1st of the next month.

>   In this context, 5 bills should be created, each with a value of R $ 400.00, with the following due dates:

>   - 10/30/2020
>   - 11/30/2020
>   - 12/30/2020
>   - 01/30/2020
>   - 03/01/2020

  ***8.4.5 Updating bill status: PUT api/v1/bills/420***

>   Parameters: Bill ID and new bill status

>   Request:

```json
{       
        "status": "Atrasada"
}
```

>   Response:

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
  ***8.4.6 Deleting an bill: DELETE api/v1/bills/10***

>   Parameters: Bill Id

>   Response:

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
