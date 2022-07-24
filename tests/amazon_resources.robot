*** Settings *** 
Library    SeleniumLibrary
Library    Screenshot

*** Variables ***
${url}                https://www.amazon.com.br/
${browser}            chrome
${menu_eletronico}    //a[contains(@href,'electronics')]
${title_eletronico}   //h1[contains(.,'Eletrônicos e Tecnologia')]

*** Keywords ***
Abrir o navegador
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
Fechar o navegador
    Capture Page Screenshot
    Close Browser
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
    Sleep              2
Verificar se aparece a categoria "${nome_categoria}"
    Element Should Be Visible     locator=//a[@aria-label='${nome_categoria}']

Digitar o nome de produto "${produto}" no campo de pesquisa
    Input Text    locator=twotabsearchtextbox    text=${produto}

Clicar no botão de pesquisa
    Click Element    locator=nav-search-submit-button

Verificar o resultado da pesquisa se está listando o produto "${produto}"
    Wait Until Element Is Visible    locator=//img[@alt='Console Xbox Series S']

Adicionar o produto "${produto}" no carrinho
    Click Element                   locator=//img[@alt='Console Xbox Series S']
    Element Should Be Visible       locator=//img[@data-a-image-name='landingImage']
    Click Element                   locator=//input[@title='Adicionar ao carrinho']

Verifica se o produto "${produto}" foi adicionado ao carrinho
    Element Should Be Visible       locator=//div[@class='a-section a-padding-medium sw-atc-message-section']
    Sleep                           3

Remover o produto "${produto}" do carrinho
    Click Element                   locator=//a[@class='a-button-text']
    Element Should Be Visible       locator=//img[contains(@height,'180')]
    Click Element                   locator=//input[@value='Excluir']

Verifica se o produto "${produto}" foi removido do carrinho
    Element Should Be Visible    locator=//div[contains(@data-name,'Active Cart')]

#GHERKIN STEPS
Dado que estou na home page da Amazon.com.br
   Acessar a home page do site Amazon.com.br
   Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."

Quando acessar o menu "Eletrônicos"
   Entrar no menu "Eletrônicos"

Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
   Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"

E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
   Verificar se aparece a frase "Eletrônicos e Tecnologia"

E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "Computadores e Informática"

Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa

Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    Verificar se o título da página fica "Amazon.com.br : Xbox Series S"

E um produto da linha "Xbox Series S" deve ser mostrado na página
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"

Quando adicionar o produto "Console Xbox Series S" no carrinho
    Adicionar o produto "Console Xbox Series S" no carrinho

Então o produto "Console Xbox Series S" deve ser mostrado no carrinho
    Verifica se o produto "Console Xbox Series S" foi adicionado ao carrinho

E existe o produto "Console Xbox Series S" no carrinho
    Verifica se o produto "Console Xbox Series S" foi adicionado ao carrinho

Quando remover o produto "Console Xbox Series S" do carrinho
    Remover o produto "Console Xbox Series S" do carrinho

Então o carrinho deve ficar vazio
    Verifica se o produto "Console Xbox Series S" foi removido do carrinho
