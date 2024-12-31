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
    Signin admin            
    Go to Memberships
    Create new membership    ${data}
    Toast should be    Matrícula cadastrada com sucesso.\n