*** Settings ***
Documentation    Ações e elementos da tela de login
Library    AppiumLibrary

*** Keywords ***

Signin with document
    [Arguments]    ${document}
    Input Text    xpath=//android.widget.EditText[@resource-id="ipAddress"]    
    ...    192.168.1.2
    Input Text    xpath=//android.widget.EditText[@resource-id="cpf"]   
    ...    ${document}
    Click Element    xpath=//android.view.ViewGroup[@resource-id="btnLogin"]

