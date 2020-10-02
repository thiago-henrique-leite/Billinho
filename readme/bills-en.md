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
