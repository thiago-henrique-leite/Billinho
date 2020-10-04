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

>   Parameters: Enrollment ID 

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
