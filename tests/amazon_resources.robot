*** Settings *** 
Library    SeleniumLibrary
Library    Screenshot

*** Variables ***
${url}                https://www.amazon.com.br
${browser}            chrome
${menu_eletronico}    //a[contains(@href,'electronics')]
${title_eletronico}   //h1[contains(.,'Eletrônicos e Tecnologia')]

*** Keywords ***
Abrir o navegador
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
Acessar a home page do site Amazon.com.br
    Go To                            url=${url}
    Wait Until Element Is Visible    locator=${menu_eletronico}
Entrar no menu "Eletrônicos"
    Click Element    locator=${menu_eletronico}
Verificar se aparece a frase "${frase}"
    Wait Until Page Contains         text=${frase}
    Wait Until Element Is Visible    locator=${title_eletronico}
Verificar se o título da página fica "${titulo}"
    Title Should Be    title=${titulo}
Fechar o navegador
    Capture Page Screenshot
    Close Browser