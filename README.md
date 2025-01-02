# Robot Smartbit

# Automação E2E Utilizando o Robot Framework

Esse é um repositório de automação de testes, desenvolvido para trabalhar com o Robot Framework.

## Table of Contents

1. [Objetivo](#objetivo)
2. [Estrtutura do projeto](#estrutura-do-projeto)
5. [Setup inicial](#setup-inicial)
6. [Executando Automação](#executando-automação)

## Objetivo

O objetivo desse projeto é criar uma automação das versões Web, API e Mobile do aplicativo Smartbit apresentados no curso Universo Robot Framework da QAx.

## Estrutura do projeto

```
|--- mobile
|----- app
|----- resources
|--------- actions
|----- tests
|--- web
|----- e2e
|----- resources
|------- fixtures
|------- libs
|------- pages
|--------- components
|----- sql
|----- tests
|--- requirements.txt
```

## Executando os testes

### Pré-requisitos

1. [Git](https://git-scm.com/) `git version 2.34.1`
2. [Nodejs](https://nodejs.org/en/) `v20.14.0`
   *    NPM `10.8.1`
   *    Yarn `1.22.22`
3. [Python](https://www.python.org/) `Python 3.10.12`
4. [Robot Framework](https://robotframework.org/) `Robot Framework 7.0`

### Setup inicial

1. Criar o ambiente virtual através do comando `python3 -m venv venv`
2. Após a criação do ambiente, iniciar através do comando `source venv/bin/activate`
3. Instalar as dependências do projeto através do comando `pip install -r requirements.txt`
4. Instalar as aplicações Smartbit disponibilizadas no curso da QAx
5. Na pasta do aplicativo Smartbit, navegar para a pasta API e realizar a configuração da conexão do banco de dados
6. Após configurar os dados de conexão, realizar a conexão inicial através do comando `./setup.sh`
7. Após realizar a conexão inicial, iniciar a API através do comando `npm run dev`
8. Ainda na pasta do aplicativo Smartbit, navegar para a pasta WEB e iniciar a aplicação através do comando npm `run dev`

### Executando Automação

- Para executar os testes na camada Web, navegue até a pasta web e execute o comando `robot -d ./logs tests/`
- Para executar os testes na camada Mobile, navegue até a pasta mobile e execute o comando `robot -d ./logs tests/`
- Para executar os testes na camada de API, navegue até a pasta services e execute o comando `robot -d ./logs tests/`
<p>
