*** Settings ***
Documentation    Arquivo principal do projeto de testes automatizados para Mobile
Library    AppiumLibrary
Library    ../../libs/Database.py
Library    JSONLibrary

Resource    ./actions/Login.resource
Resource    ./actions/Account.resource
Resource    ./actions/MyBody.resource
Resource    ./actions/components/Menu.resource
Resource    ./actions/components/Popup.resource
Resource    ../../services/Service.resource


*** Keywords ***
Start session
    Open Application    http://localhost:4723    
    ...    platformName=Android
    ...    automationName=UIAutomator2
    ...    deviceName=Emulator
    ...    app=${EXECDIR}/app/smartbit-beta.apk
    ...    autoGrantPermissions=true

    Wait Until Page Contains    IP da API    30

Finish session
    Capture Page Screenshot
    Close Application

Get Json fixture
    [Arguments]    ${scenario}
    ${data}    Load Json From File    
    ...    ${EXECDIR}/resources/fixtures/data.json
    ...    encoding=utf-8

    [Return]    ${data}[${scenario}]
