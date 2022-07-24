# Automação do site da Amazon

<p>Estudos sobre automação com o Robot Framework, usando a library do Selenium.
O curso utilizado está nesse <a href="https://www.udemy.com/course/automacao-de-testes-com-robot-framework-basico/" target="_blank">link</a>.</p>

## Install & Updates

Necessário fazer a instalação do ```Python``` e do ```Robot Framework``` com o ```pip```, verificar as versões atualizadas, de todas as tecnologias utilizadas.

$ pip install robotframework

$ pip install --upgrade robotframework==3.2.2

$ pip install --upgrade robotframework-seleniumlibrary

$ pip install robotframework-requests

$ pip install --upgrade pip

$ python -m pip --version

## Documentation

Doc utilizada para o andamento do curso, utilizando as keywords

https://robotframework.org/ <br>
https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html

## Execute

### Rodando todos os casos de testes em formato gherkin
```$ robot -d ../log amazon_testes_gherkin_bdd.robot```

### Rodando com tags
```robot -d ../log -i [tag_aqui] arquivo.robot```

O comando com (-d) passa para dentro da pasta log, todos os logs, screenshots e reports

#### :computer: By Vini Santos :keyboard: