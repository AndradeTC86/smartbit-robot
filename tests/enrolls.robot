*** Settings ***
Documentation    Suite de testes de adesões de planos
Resource    ../resources/Base.resource
Test Setup    Start session
Test Teardown    Take Screenshot

*** Test Cases ***

Deve poder realizar uma nova adesão
    Go to login page
    Submit login form    sac@smartbit.com    pwd123
    User is logged in    sac@smartbit.com
    Go to Enrolls
    Go to enroll form
    Select account    José da Silva    71276074000
    Select plan    Plano Black
    Fill payment card    4242424242424242    José da Silva    12    2099    171
    Click    css=button[type=submit] >> text=Cadastrar
    Toast should be    Matrícula cadastrada com sucesso.\n
    
*** Keywords ***

Go to Enrolls
    Click    css=a[href="/memberships"]
    Wait For Elements State    css=h1 >> text=Matrículas
    ...    visible    5

Go to enroll form
    Click    css=a[href="/memberships/new"]
    Wait For Elements State    css=h1 >> text=Nova matrícula    
    ...    visible    5

Select account
    [Arguments]    ${name}    ${cpf}
    Fill Text    css=input[aria-label=select_account]   ${name}
    Click    css=[data-testid="${cpf}"]

Select plan
    [Arguments]    ${plan}
    Fill Text    css=input[aria-label=select_plan]    ${plan}
    Click    css=div[id*=option] >> text=${plan}

Fill payment card
    [Arguments]    ${number}    ${holder}    ${month}    ${year}    ${cvv}
    Fill Text    css=input[name=card_number]    ${number}
    Fill Text    css=input[name=card_holder]    ${holder}
    Fill Text    css=input[name=card_month]     ${month}
    Fill Text    css=input[name=card_year]      ${year}
    Fill Text    css=input[name=card_cvv]       ${cvv}