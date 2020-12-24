# ***BILLINHO*** 

[![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop-hq/rubocop)

<a href="https://www.linkedin.com/in/thiagoleitesilva/">
  <img align="left" alt="Thiago's LinkdeIN" width="18px" src="https://github.com/TheDudeThatCode/TheDudeThatCode/blob/master/Assets/Linkedin.svg" />
</a>
<a href="https://www.instagram.com/thiagoh.leite/">
  <img align="left" alt="Thiago's Instagram" width="18px" src="https://github.com/TheDudeThatCode/TheDudeThatCode/blob/master/Assets/Instagram.svg" />
</a>
<a href="https://www.facebook.com/thiagohenrique.leitesilva">
  <img align="left" alt="Thiago's Facebook" width="19px" src="https://cdn.jsdelivr.net/npm/simple-icons@3.7.0/icons/facebook.svg" />
</a>

<a href="https://www.queroedu.com">
  <img align="left" alt="Quero Educação" width="21px" src="https://sobre.quero.com/wp-content/themes/quero-b2b-institutional/dist/img/logos/quero/quero_institucional_azul_mobo.svg" />
</a>

</br>
</br>

[Português](/README.md) | English

### 1. Description
  The Billinho is a project of Quero Educação, a leading educational marketing business. 
  It aims to simulate an API for managing tuition paid by students to the educational institution he studies.

<a name="ancora"></a>

### 2. Menu
  - [API Entities](#ancora1)
  - [API Actions](#ancora2)
  - [What was used to make the application](#ancora3)
  - [How to run the application](#ancora4)
  - [Additional Information](#ancora5)
  - [Project in Execution](#ancora6)


<a id="ancora1"></a>

### 3. API Entities
  These are the basic entities of the project.
 
  ***3.1 Educational institution***

  Field                                 |   Kind   |           Restrictions
  --------------------------------------|----------|----------------------------------
  Name                                  |   Text   | Not empty and unique
  CNPJ                                  |   Text   | Valid, unique and not empty
  Kind                                  |   Text   | Universidade, Escola ou Creche
  Zip code                              |   Text   | Valid
  State, City, Neighborhood and Address |   Text   | Automatically filled in from zip code
  Enabled                               |  Boolean | Default: true

  ***3.2 Student***


  Field                                  |   Kind   |                Restrictions
  ---------------------------------------|----------|---------------------------------------------
  Name                                   |   Text   | Not empty and unique
  CPF                                    |   Text   | Valid, unique and not empty 
  Date of birth                          |   Date   | Format YYYY-MM-DD  
  Phone                                  |  Integer | 
  Gender                                 |   Text   | M or F
  Payment method                         |   Text   | Boleto or Cartão
  Zip code                               |   Text   | Valid
  State, City, Neighborhood and Address  |   Text   | Automatically filled in from zip code
  Enabled                                |  Boolean | Default: true

  ***3.3 Enrollment***

  Field                        |   Kind              |                 Restrictions
  -----------------------------|---------------------|-----------------------------------------------
  Total course value           |  Decimal            | Not empty, > 0
  Number of bills              |  Integer            | Not empty, >= 1
  Bill expiration day          |  Integer            | Not empty, >= 1 e <= 31
  Course name                  |  Text               | Not empty
  Institution Id               |  Foreign key        | Not empty
  Student Id                   |  Foreign key        | Not empty
  Enabled                      |  Boolean            | Default: true

   ***3.4 Bill***

  Field                        |   Kind              |                 Restrictions
  -----------------------------|---------------------|-----------------------------------------------
  Valor da fatura em reais     |  Decimal            | Not empty
  Date de vencimento           |  Date               | Not empty
  Enrollment Id                |  Foreign key        | Not empty
  Status                       |  Text               | open, pending or paid, default open
  Student Id                   |  Foreign key        | Not empty
  Institution Id               |  Foreign key        | Not empty
  Enabled                      |  Boolean            | Default: true

</br>

<a id="ancora2"></a>

### 4. API Actions

  ***4.1 Institutions***
  -	[x] Listing.
  -	[x] Creation.
  -	[x] Update.
  - [x] Exclusion. 

  ***4.2 Students***
  -	[x] Listing.
  -	[x] Creation.
  -	[x] Update.
  - [x] Exclusion. 

  ***4.3 Enrollments***
  -	[x] Listing.
  -	[x] Creation.
  - [x] Update.
  - [x] Exclusion. 
  
  ***4.4 Bills***
  -	[x] Listing.
  -	[x] Creation.
  -	[x] Update.
  - [x] Exclusion.

</br> 

<a id="ancora3"></a>

### 5. What was used to make the application

<table>
  <tbody>
    <tr valign="top">
      <td width="25%" align="center">
        <span><b>Ruby 2.7.1</b></span><br><br><br>
        <img height="64px" src="https://cdn.jsdelivr.net/npm/simple-icons@3.9.0/icons/ruby.svg">
      </td>
      <td width="25%" align="center">
        <span><b>PSQL 12</b></span><br><br><br>
        <img height="64px" src="https://cdn.jsdelivr.net/npm/simple-icons@3.9.0/icons/postgresql.svg">
      </td>
      <td width="25%" align="center">
        <span><b>Git</b></span><br><br><br>
        <img height="64px"  src="https://cdn.jsdelivr.net/npm/simple-icons@3.9.0/icons/git.svg">
      </td>
      <td width="25%" align="center">
        <span><b>VSCode</b></span><br><br><br>
        <img height="64px" src="https://cdn.jsdelivr.net/npm/simple-icons@3.9.0/icons/visualstudio.svg">
      </td>
    </tr>
    <tr valign="top">
      <td width="22%" align="center">
        <span><b>Rails 6.0.3.3</b></span><br><br><br>
        <img height="60px" src="https://cdn.jsdelivr.net/npm/simple-icons@3.9.0/icons/rubyonrails.svg">
      </td>
      <td width="25%" align="center">
        <span><b>Postman</b></span><br><br><br>
        <img height="64px" src="https://cdn.jsdelivr.net/npm/simple-icons@3.9.0/icons/postman.svg">
      </td>
      <td width="25%" align="center">
        <span><b>Stack Overflow</b></span><br><br><br>
        <img height="64px" src="https://cdn.jsdelivr.net/npm/simple-icons@3.9.0/icons/stackoverflow.svg">
      </td>
      <td width="25%" align="center">
        <span><b>Linux</b></span><br><br><br>
        <img height="64px" src="https://cdn.jsdelivr.net/npm/simple-icons@3.9.0/icons/linux.svg">
      </td>
    </tr>
  </tbody>
</table>

</br>

<a id="ancora4"></a>

### 6. How to run the application :fire:
>>  ***6.1 Clone this repository*** 
>>>    - $ git clone git@github.com:thiago-henrique-leite/Billinho.git

>>  ***6.2 Access the project folder in the terminal***
>>>    - $ cd etc/Billinho

>>  ***6.3 Download project dependencies***
>>>    - $ bundle install

>>  ***6.4 Create the database***
>>>    - $ rails db:create
>>>    - $ rails db:migrate

>>  ***6.5 Fill the database with the default values***
>>>    - $ rails db:seed
>>>    - $ rails db:migrate

>>  ***6.6 Run the application***
>>>    - $ rails s 

>>  The server will start on the port:3000 - acesse <http://localhost:3000> </br>

>>  Use Postman for a better view of the application.

</br>

<a id="ancora5"></a>

### 7. Additional Information
> + All API routes receive and respond with data in JSON format </br>
>   - JavaScript Object Notation, or JSON, as it is known, it is basically a light format for exchanging information/data between systems. </br>
>   - JSON is not only a lightweight format for data exchange, it is also very simple to read.

> + Soft Delete
>   - In the exclusion the elements are not deleted from the database, we only do a soft delete,
> where through a 'enabled' boolean we control whether we want to view the data or not, by disabling
> a information passing the key 'enabled' to 'false', it is as if we were excluding it.
>   - Soft Delete is used for security reasons, when at some point we may need
> some information, so it cannot be permanently deleted.

</br>

<a id="ancora6"></a>

### 8. Project in Execution :rocket:

> + [**Complete API**](readme/general-en.md)
>   - [**8.1 Institutions**](readme/institutions-en.md)
>   - [**8.2 Students**](readme/students-en.md)
>   - [**8.3 Enrollments**](readme/enrollments-en.md)
>   - [**8.4 Bills**](readme/bills-en.md)
