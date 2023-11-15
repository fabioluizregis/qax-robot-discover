*** Settings ***
Documentation        Suite de testes de cadastro de dog walker

Resource    ../resources/base.resource

Test Setup        Start session
Test Teardown     Finish session

*** Test Cases ***
Deve poder cadastrar um novo dog walker
    [Tags]    Smoke
    ${dog_walker}        Create Dictionary
    ...    name=Fabio Luiz
    ...    email=fabio@luiz.com
    ...    cpf=00000014142
    ...    cep=18013004
    ...    street=Avenida São Paulo
    ...    district=Além Ponte
    ...    city_uf=Sorocaba/SP
    ...    number=10
    ...    details=casa 20
    ...    cnh=toretto.jpg

    Go to signup page
    Fill signup form    ${dog_walker}
    Click submit signup form
    Popup should be

Não deve cadastrar se o CPF for incorreto
    [Tags]    cpf_inv

    ${dog_walker}        Create Dictionary
    ...    name=Fabio Luiz
    ...    email=fabio@luiz.com
    ...    cpf=00000014142aa
    ...    cep=18013004
    ...    street=Avenida São Paulo
    ...    district=Além Ponte
    ...    city_uf=Sorocaba/SP
    ...    number=10
    ...    details=casa 20
    ...    cnh=toretto.jpg
    ...    aditional_service=Cuidar

    Go to signup page
    Fill signup form    ${dog_walker}
    Click submit signup form

Não deve cadastrar se os campos obrigatórios não forem preenchidos
    [Tags]    required

    # ${dog_walker}        Create Dictionary
    # ...    name=Fabio Luiz
    # ...    email=fabio@luiz.com
    # ...    cpf=00000014142aa
    # ...    cep=18013004
    # ...    street=Avenida São Paulo
    # ...    district=Além Ponte
    # ...    city_uf=Sorocaba/SP
    # ...    number=10
    # ...    details=casa 20
    # ...    cnh=toretto.jpg

    Go to signup page
    # Fill signup form    ${dog_walker}
    Click submit signup form

    Alert should be    Informe o seu nome completo
    Alert should be    Informe o seu melhor email
    Alert should be    Informe o seu CPF
    Alert should be    Informe o seu CEP
    Alert should be    Informe um número maior que zero
    Alert should be    Adcione um documento com foto (RG ou CHN)


Deve cadastrar um novo dog walker que saiba cuidar de pets
    [Tags]    aditional_service
    
    ${dog_walker}        Create Dictionary
    ...    name=Fabio Luiz
    ...    email=fabio@luiz.com
    ...    cpf=00000014142
    ...    cep=18013004
    ...    street=Avenida São Paulo
    ...    district=Além Ponte
    ...    city_uf=Sorocaba/SP
    ...    number=10
    ...    details=casa 20
    ...    cnh=toretto.jpg

    Go to signup page
    Fill signup form    ${dog_walker}
    Aditional Service    Cuidar
    Click submit signup form
    Popup should be

Deve cadastrar um novo dog walker que saiba adestrar de pets
    [Tags]    aditional_service
    
    ${dog_walker}        Create Dictionary
    ...    name=Fabio Luiz
    ...    email=fabio@luiz.com
    ...    cpf=00000014142
    ...    cep=18013004
    ...    street=Avenida São Paulo
    ...    district=Além Ponte
    ...    city_uf=Sorocaba/SP
    ...    number=10
    ...    details=casa 20
    ...    cnh=toretto.jpg

    Go to signup page
    Fill signup form    ${dog_walker}
    Aditional Service    Adestrar
    Click submit signup form
    Popup should be

