*** Settings ***
Documentation    Essa suíte testa o site da Amazon.com.br

Resource         amazon_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases *** 
Caso de teste 01 - Acesso ao Menu "Eletrônicos"
    [Documentation]  Esse teste verifica o menu eletrônicos do site da Amazon.com.br
    ...              e verifica a categoria Eletrônicos e Tecnologia
    [Tags]           menus  categorias
    Acessar a home page do site Amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."
    Entrar no menu "Eletrônicos"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Verificar se aparece a categoria "Computadores e Informática"
    Verificar se aparece a categoria "Tablets"

Caso de teste 02 - Pesquisa de um Produto
    [Documentation]  Esse teste verifica a busca de um produto
    [Tags]           busca_produtos  lista_busca
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"

Caso de teste 03 - Adicionar produto ao carrinho
    [Documentation]  Esse teste verifica a adição de um produto ao carrinho de comparas
    [Tags]           adicionar_carrinho
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"
    Adicionar o produto "Console Xbox Series S" no carrinho
    Verifica se o produto "Console Xbox Series S" foi adicionado ao carrinho

Caso de teste 04 - Remover Produto do Carrinho
    [Documentation]  Esse teste verifica a remoção de um produto no carrinho de compras
    [Tags]           remover_carrinho
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"
    Adicionar o produto "Console Xbox Series S" no carrinho
    Verifica se o produto "Console Xbox Series S" foi adicionado ao carrinho
    Remover o produto "Console Xbox Series S" do carrinho
    Verifica se o produto "Console Xbox Series S" foi removido do carrinho