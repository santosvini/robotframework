*** Settings ***
Documentation    Essa suíte testa uma lista

*** Variable ***
@{meses}    janeiro    fevereiro    março    abril    maio    junho    julho    agosto    setembro    outubro    novembro    dezembro 

*** Test Cases ***
Imprimir meses do ano
    Log To Console  Os meses do ano são: 
    Log To Console  O primeiro mês: ${meses[0]}
    Log To Console  O segundo mês: ${meses[1]} 
    Log To Console  O terceiro mês: ${meses[2]}
    Log To Console  O quarto mês: ${meses[3]}
    Log To Console  O quinto mês: ${meses[4]}
    Log To Console  O sexto mês: ${meses[5]}
    Log To Console  O sétimo mês: ${meses[6]}
    Log To Console  O oitavo mês: ${meses[7]}
    Log To Console  O nono mês: ${meses[8]}
    Log To Console  O décimo mês: ${meses[9]}
    Log To Console  O décimo primeiro mês: ${meses[10]}
    Log To Console  O décimo segundo mês: ${meses[11]}.