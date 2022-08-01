*** Settings *** 
Documentation    Exercício IF e FOR

*** Variable ***
@{numeros}    0  3  5  7  9  10  12

*** Test Cases ***
Teste de lista de numeros
  Imprimir somente se for 5 e 10

*** Keywords ***
Imprimir somente se for 5 e 10
  Log to console    ${\n}

  FOR  ${numero}  IN  @{numeros}
    IF  ${numero} == 5 or ${numero} == 10
      Log to console   Eu sou o número ${numero}!
    ELSE 
      Log To Console   Eu não sou o número 5 e nem o número 10!
    END
  END
