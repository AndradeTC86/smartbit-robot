*** Settings ***
Documentation    Ações e elementos da tela Meu Corpo
Library    AppiumLibrary

*** Keywords ***

Send weight and height
    [Arguments]    ${account}
    Wait Until Element Is Visible    
    ...    xpath=//android.widget.TextView[@resource-id="myBodytTitle"]   5
    Input Text    xpath=//android.widget.EditText[@resource-id="weight"]    ${account}[weight]
    Input Text    xpath=//android.widget.EditText[@resource-id="height"]    ${account}[height]
    Click Element    xpath=//android.widget.TextView[@text="Enviar minhas medidas"]
