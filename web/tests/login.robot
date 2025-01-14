*** Settings ***
Documentation    Cenários de testes do login SAC
Resource    ../resources/Base.resource
Test Setup    Start session
Test Teardown    Take Screenshot

*** Test Cases ***
Deve logar como Gestor de Academia    
    Go to login page
    Submit login form    sac@smartbit.com    pwd123
    User is logged in    sac@smartbit.com

Não deve logar com senha incorreta
    Go to login page
    Submit login form    sac@smartbit.com    abc123
    Toast should be     As credenciais de acesso fornecidas são inválidas. Tente novamente!\n

Não deve logar com e-mail não cadastrado
    Go to login page
    Submit login form    404@smartbit.com    pwd123
    Toast should be     As credenciais de acesso fornecidas são inválidas. Tente novamente!\n

Tentativa de login com dados incorretos
    [Template]    Login with verify notice
    ${EMPTY}    ${EMPTY}            Os campos email e senha são obrigatórios.
    ${EMPTY}    pwd123              Os campos email e senha são obrigatórios.
    sac@smartbit.com    ${EMPTY}    Os campos email e senha são obrigatórios.
    sac#smartbit.com    pwd123      Oops! O email informado é inválido

*** Keywords ***

Login with verify notice
    [Arguments]    ${email}    ${password}    ${output_message}
    Go to login page
    Submit login form    ${email}    ${password}
    Notice should be    ${output_message}