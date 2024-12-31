*** Settings ***
Documentation    Cenários de testes de pré-cadastro de clientes
Resource    ../resources/Base.resource
Test Setup    Start session
Test Teardown    Take Screenshot

*** Test Cases ***

Deve iniciar o cadastro do cliente
    ${account}    Create Dictionary    
    ...    name=José da Silva    
    ...    email=jsilva@mailinator.com    
    ...    cpf=71276074000
    Delete Account By Email    ${account}[email]    
    Submit signup form    ${account}
    Verify welcome message

Tentativa de pré-cadastro
    [Template]    Attempt signup
    ${EMPTY}         jsilva@mailinator.com    71276074000    Por favor informe o seu nome completo
    José da Silva    ${EMPTY}                 71276074000    Por favor, informe o seu melhor e-mail
    José da Silva    jsilva@mailinator.com    ${EMPTY}       Por favor, informe o seu CPF
    José da Silva    jsilva*mailinator.com    71276074000    Oops! O email informado é inválido
    José da Silva    jsilva@mailinator.com    71276074088    Oops! O CPF informado é inválido

*** Keywords ***

Attempt signup
    [Arguments]    ${name}    ${email}    ${cpf}    ${output_meesage}

    ${account}    Create Dictionary    
    ...    name=${name}
    ...    email=${email}
    ...    cpf=${cpf}
    
    Submit signup form    ${account}
    Notice should be    ${output_meesage}