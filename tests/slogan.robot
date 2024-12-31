*** Settings ***
Documentation         Teste para verificar o Slogan da Smartbit na WebApp
Resource    ../resources/Base.resource
*** Test Cases ***
Deve exibir o Slogan na Landing Page
    Start session
    Get Text        css=.headline h2     
    ...    equal    
    ...    Sua Jornada Fitness Começa aqui!