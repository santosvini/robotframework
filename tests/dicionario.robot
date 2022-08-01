*** Settings ***
Documentation    Essa suíte testa um dicionario de dados.

*** Variables ***
&{dias_dos_meses}     
...                   janeiro=31
...                   fevereiro=28
...                   março=31
...                   abril=30
...                   maio=31
...                   junho=30
...                   julho=31
...                   agosto=31
...                   setembro=30
...                   outubro=31
...                   novembro=30
...                   dezembro=31

*** Test Cases ***
Imprimir dias por mês de 2022
    Log    Janeiro tem ${dias_dos_meses.janeiro} dias
    Log    Fevereiro tem ${dias_dos_meses.fevereiro} dias
    Log    Março tem ${dias_dos_meses.março} dias
    Log    Abril tem ${dias_dos_meses.abril} dias
    Log    Maio tem ${dias_dos_meses.maio} dias
    Log    Junho tem ${dias_dos_meses.junho} dias
    Log    Julho tem ${dias_dos_meses.julho} dias
    Log    Agosto tem ${dias_dos_meses.agosto} dias
    Log    Setembro tem ${dias_dos_meses.setembro} dias
    Log    Outubro tem ${dias_dos_meses.outubro} dias
    Log    Novembro tem ${dias_dos_meses.novembro} dias
    Log    Dezembro tem ${dias_dos_meses.dezembro} dias