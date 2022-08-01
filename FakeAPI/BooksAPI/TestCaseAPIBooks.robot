*** Settings ***
Documentation    Documentaçao da API: https://fakerestapi.azurewebsites.net/api/v1/Books
Resource         resourceAPI.robot
Suite Setup      Conectar a API

*** Test Cases ***
Buscar a listagem de todos os livros (GET em todos os livros)
    Requisitar todos os livros
    Conferir o status code   200
    Conferir o reason   OK
    Conferir se retorna uma lista com "200" livros

Buscar um livro específico (GET em um livro específico)
    Requisitar o livro com id "15"
    Conferir o status code   200
    Conferir o reason   OK
    Conferir todos os dados corretos do livro 15
