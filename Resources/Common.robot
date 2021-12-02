*** Settings ***
Library  SeleniumLibrary
Library    RobotEyes
*** Variables ***

*** Keywords ***
Begin Web Test Grid
    Open Browser  about:blank  ${BROWSER}
    ...  remote_url=${remote_url}
    ...  desired_capabilities=${CAPABILITIESCHROME}
    Set Window Size  800  600
    Maximize Browser Window

Begin Web Test
    Open Browser  about:blank  ${BROWSER}  remote_url=${remote_url}
    Set Window Size  1920  1080
    Maximize Browser Window
    Open Eyes

End Web Test
    Close Browser

Open In Browser
    [Arguments]  ${BROWSER}
    IF    ${BROWSER} == 'edge'
          Open In Edge
    ELSE IF    ${BROWSER} == 'firefox'
               Open In FireFox
    ELSE
               Open In Chrome
    END
    Maximize Browser Window

Open In Chrome
    Open Browser  about:blank  chrome
    ...  remote_url=${remote_url}
    ...  desired_capabilities=${CAPABILITIESCHROME}

Open In FireFox
    Open Browser  about:blank  firefox
    ...  remote_url=${remote_url}
    ...  desired_capabilities=${CAPABILITIESFIREFOX}

Open In Edge
    Open Browser  about:blank  edge
    ...  remote_url=${remote_url}
    ...  desired_capabilities=${CAPABILITIESEDGE}

