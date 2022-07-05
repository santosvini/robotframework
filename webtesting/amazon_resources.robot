*** Settings *** 
Library    SeleniumLibrary

*** Variables ***
${url}                https://www.amazon.com.br
${browser}            chrome
${menu_eletronico}    //a[contains(@href,'electronics')]
${title_eletronico}  //h1[contains(.,'Eletrônicos e Tecnologia')]
${texto_eletronico}   Eletrônicos e Tecnologia


*** Keywords ***
Abrir o navegador
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
Fechar o navegador
    Close Browser
Acessar a home page do site Amazon.com.br
    Go To    url=${url}
    Wait Until Element Is Visible    locator=${menu_eletronico}
Entrar no menu "Eletrônicos"
    Click Element    locator=${menu_eletronico}
Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Wait Until Page Contains         text=${texto_eletronico}
    Wait Until Element Is Visible    locator=${title_eletronico}
