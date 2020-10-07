# ***BILLINHO*** <img src="https://img.itch.zone/aW1nLzMxNTMyMTEucG5n/original/GsOFLx.png" height = "50" width = "50">

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

Português | [English](/README-en.md)

### 1. Descrição
  O Billinho é um projeto da Quero Educação, empresa líder no ramo de marketing educacional. 
  Ele tem por objetivo simular uma API de gerenciamento das mensalidades pagas pelos alunos 
  á instituição de ensino que ele estuda.

<a name="ancora"></a>

### 2. Menu
  - [Entidades da API](#ancora1)
  - [Ações da API](#ancora2)
  - [O que foi usado para fazer a aplicação](#ancora3)
  - [Como rodar a aplicação](#ancora4)
  - [Informações Adicionais](#ancora5)
  - [Projeto em Execução](#ancora6)


<a id="ancora1"></a>

### 3. Entidades da API
  Essas são as entidades básicas do projeto.
 
  ***3.1 Instituição de Ensino***

  Campo                             |   Tipo    |           Restrições
  ----------------------------------|-----------|----------------------------------
  Nome                              |   Texto   | Não vazio e único
  CNPJ                              |   Texto   | Válido, único e não vazio
  Tipo                              |   Texto   | Universidade, Escola ou Creche
  CEP                               |   Texto   | Válido
  Estado, Cidade, Bairro e Endereço |   Texto   | Preenchido automaticamente a partir do CEP
  Enabled                           |  Booleana | Default: true

  ***3.2 Aluno***


  Campo                             |   Tipo    |                Restrições
  ----------------------------------|-----------|---------------------------------------------
  Nome                              |   Texto   | Não vazio e único
  CPF                               |   Texto   | Válido, único e não vazio 
  Data de Nascimento                |   Data    | Formato YYYY-MM-DD 
  Telefone                          |  Inteiro  | 
  Gênero                            |   Texto   | M ou F
  Meio de pagamento                 |   Texto   | Boleto ou Cartão
  CEP                               |   Texto   | Válido
  Estado, Cidade, Bairro e Endereço |   Texto   | Preenchido automaticamente a partir do CEP
  Enabled                           |  Booleana | Default: true


  ***3.3 Matrícula***

  Campo                        |   Tipo              |                 Restrições
  -----------------------------|---------------------|-----------------------------------------------
  Valor total do curso         |  Decimal            | Não vazio, > 0
  Quantidade de faturas        |  Inteiro            | Não vazio, >= 1
  Dia de vencimento das faturas|  Inteiro            | Não vazio, >= 1 e <= 31
  Nome do curso                |  Texto              | Não vazio
  Id da instituição            |  Chave estrangeira  | Não vazio
  Id do aluno                  |  Chave estrangeira  | Não vazio
  Enabled                      |  Booleana           | Default: true


   ***3.4 Faturas***

  Campo                        |   Tipo              |                 Restrições
  -----------------------------|---------------------|-----------------------------------------------
  Valor da fatura em reais     |  Decimal            | Não vazio
  Data de vencimento           |  Data               | Não vazio
  Id da matrícula              |  Chave estrangeira  | Não vazio
  Status                       |  Texto              | Aberta, Atrasada ou Paga sendo default Aberta
  Id do estudante              |  Chave estrangeira  | Não vazio
  Id da instituição            |  Chave estrangeira  | Não vazio
  Enabled                      |  Booleana           | Default: true


</br>

<a id="ancora2"></a>

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

<a id="ancora3"></a>

### 5. O que foi usado para fazer a aplicação

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

### 6. Como rodar a aplicação :fire:
>>  ***6.1 Clone este repositório*** 
>>>    - $ git clone git@github.com:thiago-henrique-leite/Billinho.git

>>  ***6.2 Acesse a pasta do projeto no terminal***
>>>    - $ cd etc/Billinho

>>  ***6.3 Baixe as dependências do projeto***
>>>    - $ bundle install

>>  ***6.4 Crie o banco de dados***
>>>    - $ rails db:create
>>>    - $ rails db:migrate

>>  ***6.5 Preencha o banco com os valores padrões***
>>>    - $ rails db:seed
>>>    - $ rails db:migrate

>>  ***6.6 Rode a aplicação***
>>>    - $ rails s 

>>  O servidor inciará na porta:3000 - acesse <http://localhost:3000> </br>

>>  Utilize o Postman para uma melhor visualização da aplicação.

</br>

<a id="ancora5"></a>

### 7. Informações Adicionais
> + Todos as rotas da API recebem e respondem com dados no formato JSON </br>
>   - JavaScript Object Notation, ou JSON, como é conhecido, é basicamente um formato leve de troca de informações/dados entre sistemas. </br>
>   - O JSON além de ser um formato leve para troca de dados é também muito simples de ler. 

> + Soft Delete
>   - Na exclusão os elementos não são apagados do banco de dados, fazemos apenas um soft delete,
> onde através de um booleano 'enabled' controlarmos se queremos visualisar o dado ou não, ao desabilitarmos
> uma informação passando a chave 'enabled' para 'false', é como se estivéssemos excluindo ela.
>   - O Soft Delete é utilizado por questões de segurança, quando em algum momento podemos precisar de
> alguma informação, logo ela não pode ser excluída permanentemente.

</br>

<a id="ancora6"></a>

### 8. Projeto em Execução :rocket:

> + [**API Completa**](readme/general-pt.md)
>   - [**8.1 Instituições**](readme/institutions-pt.md)
>   - [**8.2 Estudantes**](readme/students-pt.md)
>   - [**8.3 Matrículas**](readme/enrollments-pt.md)
>   - [**8.4 Faturas**](readme/bills-pt.md)
