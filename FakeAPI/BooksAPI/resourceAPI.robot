*** Settings ***
Documentation    Documentaçao da API: https://fakerestapi.azurewebsites.net/api/v1/Books
Library          RequestsLibrary
Library          Collections

*** Variables ***
${URL_API}    https://fakerestapi.azurewebsites.net/api/v1
&{book_15}    id=15
...           title=Book 15
...           description=Lorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\n
...           pageCount=1500
...           excerpt=Lorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\n

*** Keywords ***
##SETUP E TEARDOWNS##
Conectar a API
    Create Session    fakeApi     ${URL_API}

##AÇÔES##
Requisitar todos os livros
    ${resposta}          GET On Session     fakeApi    Books
    Log                  ${resposta.text}
    Set Test Variable    ${resposta}

Requisitar o livro com id "${id_livro}"
    ${resposta}          GET On Session     fakeApi    Books/${id_livro}
    Log                  ${resposta.text}
    Set Test Variable    ${resposta}

##CONFERÊNCIAS##
Conferir o status code
    [Arguments]    ${statuscode_desejado}
    Should Be Equal As Strings    ${resposta.status_code}    ${statuscode_desejado}

Conferir o reason
    [Arguments]    ${reason_desejado}
     Should Be Equal As Strings    ${resposta.reason}    ${reason_desejado}

Conferir se retorna uma lista com "${qtde_livros}" livros
    Length Should Be    ${resposta.json()}    ${qtde_livros}

Conferir todos os dados corretos do livro 15
    Dictionary Should Contain Item    ${resposta.json()}    id             ${book_15.id}
    Dictionary Should Contain Item    ${resposta.json()}    title          ${book_15.title}
    Dictionary Should Contain Item    ${resposta.json()}    description    ${book_15.description}
    Dictionary Should Contain Item    ${resposta.json()}    pageCount      ${book_15.pageCount}
    Dictionary Should Contain Item    ${resposta.json()}    excerpt        ${book_15.excerpt}
    Should Not Be Empty               ${resposta.json()["publishDate"]}    
    