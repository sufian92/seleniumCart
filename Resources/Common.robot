*** Settings ***
Library  SeleniumLibrary

*** Variables ***

*** Keywords ***
Begin Web Test
    Open Browser  about:blank  ${BROWSER}
    ...  remote_url=${remote_url}
    ...  desired_capabilities=${capabilities}

    Maximize Browser Window

End Web Test
    Close Browser
