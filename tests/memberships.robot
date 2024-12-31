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

Não deve realizar adesão duplicada
    ${data}    Get Json fixture    memberships    duplicate
    Insert Membership    ${data}
    Signin admin            
    Go to Memberships    
    Create new membership    ${data}
    Toast should be    O usuário já possui matrícula.\n

Deve buscar por nome
    [Tags]    buscar
    ${data}    Get Json fixture    memberships    search
    Insert Membership    ${data}
    Signin admin            
    Go to Memberships
    Search by name    ${data}[account][name]
    Should filter by name    ${data}[account][name]