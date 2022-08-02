*** Settings ***
Documentation    Documentaçao da API: https://fakerestapi.azurewebsites.net/api/v1/Books
Library         RequestsLibrary
Library         Collections
# Library         SeleniumLibrary

*** Variables ***
${URL_API}    https://fakerestapi.azurewebsites.net/api/v1
&{book_15}    id=15
...           title=Book 15
...           description=Lorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\n
...           pageCount=1500
...           excerpt=Lorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\n

&{book_500}   id=500
...           title=teste
...           description=teste
...           pageCount=200
...           excerpt=teste
...           publishDate=2022-08-01T19:48:26.403Z

&{book_150}   id=150
...           title=Book 150
...           description=Livro alterado
...           pageCount=300
...           excerpt=Alterado
...           publishDate=2022-08-02T14:00:42.376Z

*** Keywords ***
##SETUP E TEARDOWNS##
Conectar a minha API
    Create Session    fakeApi     ${URL_API}
    ${headers}     Create Dictionary    content-type=application/json
    Set Suite Variable    ${headers}

##AÇÔES##
Requisitar todos os livros
    ${resposta}          GET On Session     fakeApi    Books
    Log                  ${resposta.text}
    Set Test Variable    ${resposta}

Requisitar o livro "${id_livro}"
    ${resposta}          GET On Session     fakeApi    Books/${id_livro}
    Log                  ${resposta.text}
    Set Test Variable    ${resposta}

Cadastrar um novo livro
    ${resposta}          POST On Session        fakeApi    Books
    ...                                         data={"id": 500, "title": "teste", "description": "teste", "pageCount": 200, "excerpt": "teste", "publishDate": "2022-08-01T19:48:26.403Z"}
    ...                                         headers=${headers}
    Log                  ${resposta.text}
    Set Test Variable    ${resposta}

##CONFERÊNCIAS##
Alterar o livro "${id_livro}"
    ${resposta}    PUT On Session    fakeAPI    Books/${id_livro}
    ...                           data={"id": ${book_150.id},"title": "${book_150.title}","description": "${book_150.description}","pageCount": ${book_150.pageCount},"excerpt": "${book_150.excerpt}","publishDate": "${book_150.publishDate}"}
    ...                           headers=${headers}
    Log                  ${resposta.text}
    Set Test Variable    ${resposta}

Excluir o livro "${id_livro}"
    ${resposta}    DELETE On Session    fakeAPI    Books/${id_livro}
    Log                  ${resposta.text}
    Set Test Variable    ${resposta}
Conferir o status code
    [Arguments]                   ${statuscode_desejado}
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

Conferir todos os dados cadastrados para o livro "${id_livro}"
    Conferir livro     ${id_livro}

Conferir se retorna todos os dados alterados do livro "${id_livro}"
    Conferir livro     ${id_livro}
Conferir livro
    [Arguments]    ${id_livro}
    Dictionary Should Contain Item    ${resposta.json()}    id             ${book_${id_livro}.id}
    Dictionary Should Contain Item    ${resposta.json()}    title          ${book_${id_livro}.title}
    Dictionary Should Contain Item    ${resposta.json()}    description    ${book_${id_livro}.description}
    Dictionary Should Contain Item    ${resposta.json()}    pageCount      ${book_${id_livro}.pageCount}
    Dictionary Should Contain Item    ${resposta.json()}    excerpt        ${book_${id_livro}.excerpt}
    Should Not Be Empty               ${resposta.json()["publishDate"]}

Conferir se excluiu o livro "${id_livro}"
    Should Be Empty    ${resposta.content}