# ***BILLINHO*** <img src="https://img.itch.zone/aW1nLzMxNTMyMTEucG5n/original/GsOFLx.png" height = "50" width = "50">

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

### 1. Descrição
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
  - [x] Exclusão. 

  ***4.2 Estudantes***
  -	[x] Listagem.
  -	[x] Criação.
  -	[x] Atualização.
  - [x] Exclusão. 

  ***4.3 Matrículas***
  -	[x] Listagem.
  -	[x] Criação.
  - [x] Atualização.
  - [x] Exclusão. 
  
  ***4.4 Faturas***
  -	[x] Listagem.
  -	[x] Criação.
  -	[x] Atualização.
  - [x] Exclusão.

</br> 

### 5. O que foi usado para fazer a aplicação


<table>
  <tbody>
    <tr valign="top">
      <td width="22%" align="center">
        <span><b>Ruby 2.7.1</b></span><br><br><br>
        <img height="60px" src="https://www.vectorlogo.zone/logos/ruby-lang/ruby-lang-ar21.svg">
      </td>
      <td width="22%" align="center">
        <span><b>PSQL 12</b></span><br><br><br>
        <img height="60px" src="https://www.vectorlogo.zone/logos/postgresql/postgresql-vertical.svg">
      </td>
      <td width="22%" align="center">
        <span><b>Git</b></span><br><br><br>
        <img height="60px"  src="https://cdn.svgporn.com/logos/git-icon.svg">
      </td>
      <td width="22%" align="center">
        <span><b>VSCode</b></span><br><br><br>
        <img height="60px" src="https://cdn.svgporn.com/logos/visual-studio-code.svg">
      </td>
      <td width="22%" align="center">
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

[[API Completa    ]](/REAMDE's/Funcionamento) -
 [[8.1 Instituições]](/README's/institutions) -
 [[8.2 Estudantes  ]](/README's/students) -
 [[8.3 Matrículas  ]](/README's/enrollments) -
 [[8.4 Faturas     ]](/README's/bills)
