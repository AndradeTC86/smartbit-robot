*** Settings ***
Documentation    Ações e elementos da barra de navegação
Library    Browser

*** Keywords ***

Go to Memberships
    Click    css=a[href="/memberships"]
    Wait For Elements State    css=h1 >> text=Matrículas
    ...    visible    5