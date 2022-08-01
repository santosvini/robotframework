*** Settings ***
Library          String 
Documentation    Testar exemplo com argumentos

*** Variables ***
&{pessoa}    Nome=Vinicius    Sobrenome=Santos

*** Test Cases ***
Impressão de email aleatorio customizado
    ${email_final}   Criacao de email aleatório  ${pessoa.Nome}  ${pessoa.Sobrenome}
    Log              message=${email_final}

*** Keywords ***
Criacao de email aleatório
    [Arguments]      ${Nome}    ${Sobrenome}
    ${aleatorio}     Generate Random String
    ${email_final}   Set Variable              ${Nome}${Sobrenome}${aleatorio}@testerobot.com
    [Return]         ${email_final}