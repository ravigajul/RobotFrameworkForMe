*** Settings ***
Documentation       Simple test to login to https://automationplayground.com/crm/ web app and verify if the login is successfull
Library             SeleniumLibrary
#  robot -d .\Results\ .\Tests\CRM.robot
*** Variables ***
# $url=https://automationplayground.com/crm/
*** Test Cases ***
Should be able to login to the crm web application
    [Documentation]         This test case is to verify the login with valid credentials
    [Tags]                  01      Login       Smoke
    log                     Starting the test case
    open browser            https://automationplayground.com/crm/       chrome
    maximize browser window
    click link              id:SignIn
    wait until element is visible    css:div h2
    input text              css:input[placeholder="Enter email"]            ravi.gajul@test.com
    input password          css:input[placeholder="Password"]   testing
    click button            submit-id
    sleep                   5s
    wait until element is visible    css:div h2
    element text should be          css:div h2    Our Happy Customers
    close browser

*** Keywords ***

