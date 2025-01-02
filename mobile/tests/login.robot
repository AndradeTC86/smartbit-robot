*** Settings ***
Documentation    Suite de testes de login
Resource    ../resources/Base.resource

Test Setup    Start session
Test Teardown    Finish session

*** Test Cases ***

Deve logar com o IP e cpf
    ${data}    Get Json fixture    login
    Insert Membership    ${data}
    Signin with document    ${data}[account][cpf]	    
    User is logged in

Não deve logar com cpf não cadastrado
    Signin with document    03956593022
    Popup have text    Acesso não autorizado! Entre em contato com a central de atendimento

Não deve logar com cpf com digito inválido
    Signin with document    03956593039
    Popup have text    CPF inválido, tente novamente
    



 
