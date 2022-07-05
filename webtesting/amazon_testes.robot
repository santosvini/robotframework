*** Test Cases *** 

Caso de teste 01 - Acesso ao Menu "Eletrônicos"
    [Documentation]  Esse teste verifica o menu eletrônicos do site da Amazon.com.br
    ...              e verifica a categoria Computadores e Informática
    [Tags]           menus  categorias
    Acessar a home page do site Amazon.com.br
    Entrar no menu "Eletrônicos"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Verificar se aparece a categoria "Computadores e Informática"



Caso de teste 02 - Pesquisa de um Produto
    [Documentation]  Esse teste verifica a busca de um produto
    [Tags]           busca_produtos  lista_busca
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa 
    Verificar o resultado da pesquisa se está listando o produto pesquisado.