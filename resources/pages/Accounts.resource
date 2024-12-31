*** Settings ***
Documentation    Ações e elementos da página de Clientes
Library    Browser

*** Keywords ***

User is logged in
    [Arguments]    ${email}
    ${element}    Set Variable    css=.logged-user
    Wait For Elements State    ${element}    visible    15
    Get Text    ${element}    equal    ${email}