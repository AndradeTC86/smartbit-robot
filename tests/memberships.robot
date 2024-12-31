*** Settings ***
Documentation    Suite de testes de adesões de planos
Resource    ../resources/Base.resource
Test Setup    Start session
Test Teardown    Take Screenshot

*** Test Cases ***

Deve poder realizar uma nova adesão
    ${account}    Create Dictionary    
    ...    name=João de Oliveira    
    ...    email=joliveira@mailinator.com    
    ...    cpf=85565825083
    
    ${credit_card}    Create Dictionary    
    ...    number=4242424242424242
    ...    holder=João de Oliveira
    ...    month=08
    ...    year=2099
    ...    cvv=171
    
    ${plan}    Set Variable    Plano Black

    Delete Account By Email    ${account}[email]
    Insert Account             ${account}
    Go to login page
    Submit login form    sac@smartbit.com    pwd123
    User is logged in    sac@smartbit.com
    Go to Memberships
    Go to memberships form
    Select account    ${account}[name]    ${account}[cpf]
    Select plan    ${plan}
    Fill payment card    ${credit_card}
    Click record button
    Toast should be    Matrícula cadastrada com sucesso.\n