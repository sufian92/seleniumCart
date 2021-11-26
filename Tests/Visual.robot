*** Settings ***
Library  JSONLibrary
Library    RobotEyes
Documentation  This is some basic info about the whole suite
Resource  ../Resources/Common.robot  # for Setup & Teardown
Resource  ../Resources/CartApp.robot  # for lower level keywords in test cases
Resource  ../Resources/JsonParser.robot  # for lower level keywords in test cases
Resource  ../Resources/DBReader.robot  # for lower level keywords in test cases
Resource  ../Data/InputData.robot  # for lower level keywords in test case
Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test


*** Variables ***
@{redact} =  css=.blinkingText  css=.cart-icon
${element} =  css=.search-keyword

*** Test Cases ***

Sample visual regression test case with redact  # Name of the example test case
    CartApp.Go To Application
    Open Eyes    SeleniumLibrary
    Capture Full Screen  name=redact  redact=${redact}
    Compare Images
    Capture Element  ${element}  name=element
    Compare Images