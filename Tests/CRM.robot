*** Settings ***
Documentation       Simple test to login to https://automationplayground.com/crm/ web app and verify if the login is successfull
Library             SeleniumLibrary
*** Variables ***
# $url=https://automationplayground.com/crm/
*** Test Cases ***
Should be able to login to the crm web application
    [Documentation]         This test case is to verify the login with valid credentials
    [Tags]                  01      Login       Smoke
    log                     Starting the test case
    open browser            https://automationplayground.com/crm/       chrome
    sleep                   10s
    close browser

*** Keywords ***

