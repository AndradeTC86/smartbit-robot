*** Settings ***
Documentation    Suite de testes de adesões de planos
Resource    ../resources/Base.resource
Test Setup    Start session
Test Teardown    Take Screenshot

*** Test Cases ***

Deve poder realizar uma nova adesão
    ${data}    Get Json fixture    memberships    create
    Delete Account By Email    ${data}[account][email]
    Insert Account             ${data}[account]
    Go to login page
    Submit login form    sac@smartbit.com    pwd123
    User is logged in    sac@smartbit.com
    Go to Memberships
    Go to memberships form
    Select account    ${data}[account][name]    ${data}[account][cpf]
    Select plan    ${data}[plan]
    Fill payment card    ${data}[credit_card]
    Click record button
    Toast should be    Matrícula cadastrada com sucesso.\n