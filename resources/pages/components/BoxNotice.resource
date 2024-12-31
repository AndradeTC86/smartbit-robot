*** Settings ***
Documentation    Ações e elementos do componente de caixa de notificação
Library    Browser

*** Keywords ***

Notice should be
    [Arguments]    ${target}

    Wait For Elements State    
    ...    css=form .notice
    ...    visible    5

    Get Text    css=form .notice    
    ...    equal    
    ...    ${target}