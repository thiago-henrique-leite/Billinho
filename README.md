# ***BILLINHO*** <img src="https://img.itch.zone/aW1nLzMxNTMyMTEucG5n/original/GsOFLx.png" height = "50" width = "50">

<a href="https://www.linkedin.com/in/thiagoleitesilva/">
  <img align="left" alt="Thiago's LinkdeIN" width="22px" src="https://github.com/TheDudeThatCode/TheDudeThatCode/blob/master/Assets/Linkedin.svg" />
</a>
<a href="https://www.instagram.com/thiagoh.leite/">
  <img align="left" alt="Thiago's Instagram" width="22px" src="https://github.com/TheDudeThatCode/TheDudeThatCode/blob/master/Assets/Instagram.svg" />
</a>
<a href="https://www.facebook.com/thiagohenrique.leitesilva">
  <img align="left" alt="Thiago's Facebook" width="22px" src="https://cdn.jsdelivr.net/npm/simple-icons@3.7.0/icons/facebook.svg" />
</a>

<a href="https://sobre.quero.com/">
  <img align="left" alt="Thiago's Facebook" width="26px" src="https://sobre.quero.com/wp-content/themes/quero-b2b-institutional/dist/img/logos/quero/quero_institucional_azul_mobo.svg" />
</a>

</br>

### 1. Descrição :pencil:
  O Billinho é um projeto da Quero Educação, empresa líder no ramo de marketing educacional. 
  Ele tem por objetivo simular uma API de gerenciamento das mensalidades pagas pelos alunos 
  á instituição de ensino que ele estuda.


### 2. Status do Projeto
  :construction: Em construção... :construction:


### 3. Entidades da API
  Essas são as entidades básicas do projeto.
 
  ***3.1 Instituição de Ensino***

  Campo  |   Tipo   |           Restrições
  -------|----------|----------------------------------
  Nome   |   Texto  | Não vazio e único
  CNPJ   |   Texto  | 14 caracteres numéricos e único
  Tipo   |   Texto  | Universidade, Escola ou Creche

  ***3.2 Aluno***


  Campo               |   Tipo   |                Restrições
  --------------------|----------|---------------------------------------------
  Nome                |   Texto  | Não vazio e único
  CPF                 |   Texto  | 11 caracteres numéricos, único e não vazio 
  Data de Nascimento  |   Data   | Formato yyyy-mm-dd (Facultativo)
  Telefone            |  Inteiro | 
  Gênero              |   Texto  | M ou F
  Meio de pagamento   |   Texto  | Boleto ou Cartão

  ***3.3 Matrícula***

  Campo                        |   Tipo              |                 Restrições
  -----------------------------|---------------------|-----------------------------------------------
  Valor total do curso         |  Decimal            | Não vazio, > 0
  Quantidade de faturas        |  Inteiro            | Não vazio, >= 1
  Dia de vencimento das faturas|  Inteiro            | Não vazio, >= 1 e <= 31
  Nome do curso                |  Texto              | Não vazio
  Id da instituição            |  Chave estrangeira  | Não vazio
  Id do aluno                  |  Chave estrangeira  | Não vazio

   ***3.4 Faturas***

  Campo                        |   Tipo              |                 Restrições
  -----------------------------|---------------------|-----------------------------------------------
  Valor da fatura em reais     |  Decimal            | Não vazio
  Data de vencimento           |  Data               | Não vazio
  Id da matrícula              |  Chave estrangeira  | Não vazio
  Status                       |  Texto              | Aberta, Atrasada ou Paga sendo default Aberta
  Id do estudante              |  Chave estrangeira  | Não vazio

</br>

### 4. Ações da API

  ***4.1 Instituições***
  -	[x] Listagem.
  -	[x] Criação.
  -	[x] Atualização.
  -     [x] Exclusão. 

  ***4.2 Estudantes***
  -	[x] Listagem.
  -	[x] Criação.
  -	[x] Atualização.
  -     [x] Exclusão. 

  ***4.3 Matrículas***
  -	[x] Listagem.
  -	[x] Criação.
  -     [x] Atualização.
  -     [x] Exclusão. 
  
  ***4.4 Faturas***
  -	[x] Listagem.
  -	[x] Criação.
  -	[x] Atualização.
  -     [x] Exclusão.

</br> 

### 5. O que foi usado para fazer a aplicação


<table>
  <tbody>
    <tr valign="top">
      <td width="21%" align="center">
        <span><b>Ruby 2.7.1</b></span><br><br><br>
        <img height="58px" src="https://www.vectorlogo.zone/logos/ruby-lang/ruby-lang-ar21.svg">
      </td>
      <td width="21%" align="center">
        <span><b>PostgreSQL 12</b></span><br><br><br>
        <img height="58px" src="https://www.vectorlogo.zone/logos/postgresql/postgresql-vertical.svg">
      </td>
      <td width="21%" align="center">
        <span><b>Git</b></span><br><br><br>
        <img height="58px"  src="https://cdn.svgporn.com/logos/git-icon.svg">
      </td>
      <td width="21%" align="center">
        <span><b>VSCode</b></span><br><br><br>
        <img height="58px" src="https://cdn.svgporn.com/logos/visual-studio-code.svg">
      </td>
      <td width="21%" align="center">
        <span><b>Rails 6.0.3.3</b></span><br><br><br>
        <img height="60px" src="https://pbs.twimg.com/profile_images/691206086955790336/CDMbA57p.png">
      </td>
    </tr>
  </tbody>
</table>

</br>

### 6. Como rodar a aplicação :rocket:
>>  ***6.1 Clone este repositório*** 
>>>      - $ git clone git@github.com:thiago-henrique-leite/Billinho.git

>>  ***6.2 Acesse a pasta do projeto no terminal***
>>>      - $ cd etc/Billinho

>>  ***6.3 Baixe as dependências do projeto***
>>>      - $ bundle install

>>  ***6.7 Crie o banco de dados***
>>>      - $ rails db:create
>>>      - $ rails db:migrate

>>  ***6.8 Preencha o banco com os valores padrões***
>>>      - $ rails db:seed

>>  ***6.9 Rode a aplicação***
>>>      - $ rails s 

>>  O servidor inciará na porta:3000 - acesse <http://localhost:3000> </br>

>>  Utilize o Postman para uma melhor visualização da aplicação.

</br>

### 7. Informações adicionais
  - Todos as rotas da API recebem e respondem com dados no formato JSON </br>

  > JavaScript Object Notation, ou JSON, como é conhecido, é basicamente um formato leve de troca de informações/dados entre sistemas. </br>

  > O JSON além de ser um formato leve para troca de dados é também muito simples de ler. 

</br>

### 8. Projeto em Execução

#### 8.1 Instituições

  ***8.1.1 Visualizando todas as instituições: GET api/v1/institutions***

>   Retorno:

```json
"status": "SUCCESSO",
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
"status": "SUCCESSO",
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
    "status": "SUCCESSO",
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
    "status": "SUCCESSO",
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
    "status": "SUCCESSO",
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

#### 8.2 Estudantes

  ***8.2.1 Visualizando todos os estudantes: GET api/v1/students***

>   Retorno:

```json
{
    "status": "SUCCESSO",
    "message": "Lista de Estudantes Carregada.",
    "data": [
        {
            "id": 1,
            "nome": "Estudante 1",
            "cpf": "98404479771",
            "data_nasc": "2001-04-10",
            "telefone": 116469569,
            "genero": "F",
            "meio_pagamento": "Cartão",
            "created_at": "2020-09-23T17:36:43.628Z",
            "updated_at": "2020-09-23T17:36:43.628Z"
        },
        {
            "id": 2,
            "nome": "Estudante 2",
            "cpf": "75211848308",
           "data_nasc": "1995-07-24",
            "telefone": 874784207,
            "genero": "M",
            "meio_pagamento": "Boleto",
            "created_at": "2020-09-23T17:36:43.634Z",
            "updated_at": "2020-09-23T17:36:43.634Z"
         },
```

  ***8.2.2 Visualizando estudante específico: GET api/v1/students/1***

>   Parâmetros: id do estudante

>   Retorno: 

```json
{
    "status": "SUCCESSO",
    "message": "Estudante 5 carregado.",
    "data": {
        "id": 5,
        "nome": "Estudante A",
        "cpf": "98404479771",
        "data_nasc": "2001-04-10",
        "telefone": 116469569,
        "genero": "F",
        "meio_pagamento": "Cartão",
        "created_at": "2020-09-23T17:36:44.081Z",
        "updated_at": "2020-09-23T17:36:44.081Z"
    }
}
```

  ***8.2.3 Criando estudante: POST api/v1/students***

>   Parâmetros: Nome, cpf, gênero e meio de pagamento das faturas 

>   Requisição

```json
{
        "nome": "Aluno 1",
        "cpf": "12345678910",
        "genero": "M",
        "meio_pagamento": "Cartão",
        "data_nasc": "2000-12-07",
        "telefone": 998804342
}
```

>  Retorno: 

```json
{
    "status": "SUCCESSO",
    "message": "Estudante Cadastrado.",
    "data": {
        "id": 3,
        "nome": "Aluno 1",
        "cpf": "12345678910",
        "data_nasc": "2000-12-07",
        "telefone": 998804342,
        "genero": "M",
        "meio_pagamento": "Cartão",
        "created_at": "2020-09-23T22:39:13.899Z",
        "updated_at": "2020-09-23T22:39:13.899Z"
    }
}
```

  ***8.2.4 Atualizando estudante: PUT api/v1/students/3***

>   Parâmetros: id do estudante

>   Na requisição colocar apenas o campo que quer atualizar.

>   Requisição:

```json
{
        "meio_pagamento": "Boleto",
        "telefone": 822398342
}
```

>   Resposta:

```json
{
    "status": "SUCCESSO",
    "message": "Estudante 3 Atualizado.",
    "data": {
        "id": 3,
        "nome": "Aluno 1",
        "cpf": "12345678910",
        "data_nasc": "2000-12-07",
        "telefone": 822398342,
        "genero": "M",
        "meio_pagamento": "Boleto",
        "created_at": "2020-09-23T22:39:13.899Z",
        "updated_at": "2020-09-23T22:39:13.899Z"
    }
}
```

  ***8.2.5 Deletando um estudante: DELETE api/v1/students/10***

>   Parâmetros: id do estudante
>   Obs: A exclusão de um estudante exclui também todas as matrículas e faturas vinculadas a ele.

>   Retorno:

```json
{
    "status": "SUCCESSO",
    "message": "Estudante 10 deletado",
    "data": {
        "id": 10,
        "nome": "Estudante 10",
        "cpf": "55446907512",
        "data_nasc": "1998-01-19",
        "telefone": 599955516,
        "genero": "F",
        "meio_pagamento": "Cartão",
        "created_at": "2020-09-24T18:25:55.870Z",
        "updated_at": "2020-09-24T18:25:55.870Z"
    }
}
```

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


#### 8.4 Faturas

  ***8.4.1 Visualizando todas as faturas: GET api/v1/bills***

>   Resposta: 

```json
{
    "status": "SUCCESSO",
    "message": "Todas as faturas carregadas.",
    "data": [
        {
            "id": 1,
            "valor_fatura": "654.54",
            "data_vencimento": "2020-10-07",
            "enrollment_id": 21,
            "status": "Aberta",
            "student_id": 63,
            "created_at": "2020-09-23T17:36:46.052Z",
            "updated_at": "2020-09-23T17:36:46.052Z"
        },
        {
            "id": 2,
            "valor_fatura": "777.69",
            "data_vencimento": "2020-11-07",
            "enrollment_id": 21,
            "status": "Paga",
            "student_id": 63,
            "created_at": "2020-09-23T17:36:46.056Z",
            "updated_at": "2020-09-23T17:36:46.056Z"
        },
```

  ***8.4.2 Visualizando fatura específica: GET api/v1/bills/407***

>   Resposta: 

```json
{
    "status": "SUCCESSO",
    "message": "Fatura 407 Carregada.",
    "data": {
        "id": 407,
        "valor_fatura": "379.73",
        "data_vencimento": "2020-10-07",
        "enrollment_id": 115,
        "status": "Aberta",
        "student_id": 42,
        "created_at": "2020-09-23T17:36:46.052Z",
        "updated_at": "2020-09-23T17:36:46.052Z"
    }
}
```

  ***8.4.3 Visualizando todas as faturas de uma matrícula específica: GET api/v1/enrollments/3/bills***

>   Parâmetros: id da fatura

>   Observação: É possível ainda visualizar tofas as faturas de um estudante: GET api/v1/students/4/bills

>   Resposta: 

```json
{
    "status": "SUCCESSO",
    "message": "Faturas da Matrícula 115 carregadas.",
    "data": [
        {
            "id": 407,
            "valor_fatura": "379.73",
            "data_vencimento": "2020-10-07",
            "enrollment_id": 115,
            "status": "Aberta",
            "student_id": 42,
            "created_at": "2020-09-23T17:36:46.052Z",
            "updated_at": "2020-09-23T17:36:46.052Z"
        },
        {
            "id": 408,
            "valor_fatura": "379.73",
            "data_vencimento": "2020-11-07",
            "enrollment_id": 115,
            "status": "Aberta",
            "student_id": 85,
            "created_at": "2020-09-23T17:36:46.056Z",
            "updated_at": "2020-09-23T17:36:46.056Z"
        }
    ]
}
```

  ***8.4.4 Criando faturas***

   A criação de faturas é um pouco diferente do restante, elas são criadas juntamente com a matrícula. O sistema cria  </br>
   o número correto de faturas de acordo com o valor do campo Quantidade de faturas da matrícula criada. Para definir  </br>
   o valor de cada fatura basta dividir o Valor total do curso em reais pela Quantidade de faturas, ambos valores      </br>
   pertencentes à matrícula. Na definição da data de vencimento, caso o dia de vencimento recebido seja menor ou igual </br> 
   ao dia do mês atual, as faturas devem iniciar no próximo mês, caso contrário, devem iniciar no mês atual.           </br>

   Por exemplo, hoje sendo dia 01/10/2020 e o dia de vencimento igual a 30, a data de vencimento da primeira fatura  </br>
   deve ser 30/10/2020, as datas de vencimento das demais faturas devem ser sempre no mês seguinte da anterior:      </br>

   Hoje sendo 01/10/2020

   Com os seguintes dados da matrícula:

  Valor total do curso | Quantidade | Dia de vencimento | ID da Instiuição | ID do aluno
  ---------------------|------------|-------------------|------------------|-------------
  2000.00              |     5      |        30         |        1         |      1

   Assumimos que tanto a instituição de ensino, quanto o aluno já foram criados anteriormente)

   Obs: Quando o mês não possui o número de dias da data de vencimento da fatura, ela passa a vencer no dia 01 do próximo mês.

   Neste contexto deverão ser criadas 5 faturas, cada uma com o valor de R$ 400,00, com as seguintes datas de vencimento:

   - 30/10/2020
   - 30/11/2020
   - 30/12/2020
   - 30/01/2020
   - 01/03/2020

  ***8.4.5 Atualizando status da fatura: PUT api/v1/bills/420***

>   Parâmetros: id da fatura e novo status da fatura

>   Requisição:

```json
{       
        "status": "Atrasada"
}
```

>   Resposta:

```json
{
    "status": "SUCCESSO",
    "message": "Fatura 410 Atualizada.",
    "data": {
        "id": 410,
        "status": "Atrasada",
        "enrollment_id": 116,
        "valor_fatura": "108.39",
        "data_vencimento": "2020-10-29",
        "student_id": 91,
        "created_at": "2020-09-23T17:36:46.072Z",
        "updated_at": "2020-09-24T12:43:23.244Z"
    }
}
```
  ***8.4.6 Deletando uma faturas: DELETE api/v1/bills/10***

>   Parâmetros: id da fatura

>   Retorno:

```json
{
    "status": "SUCCESSO",
    "message": "Fatura 10 Deletada.",
    "data": {
        "id": 10,
        "valor_fatura": "242.17",
        "data_vencimento": "2020-10-30",
        "enrollment_id": 3,
        "status": "Aberta",
        "student_id": 3,
        "created_at": "2020-09-24T18:25:58.195Z",
        "updated_at": "2020-09-24T18:25:58.195Z"
    }
}
```
