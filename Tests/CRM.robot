*** Settings ***
Documentation       Simple test to login to https://automationplayground.com/crm/ web app and verify if the login is successfull
Library             SeleniumLibrary
# Run the script
# robot -d Results Tests/CRM.robot
*** Variables ***
# $url=https://automationplayground.com/crm/
${BROWSER}      chrome
*** Test Cases ***
Should be able to login to the crm web application
    [Documentation]         This test case is to verify the login with valid credentials
    [Tags]                  01      Login       Smoke
    log                     Starting the test case
#    open browser            https://automationplayground.com/crm/       edge
    open browser            https://automationplayground.com/crm/       ${BROWSER}
    maximize browser window
    click link              id:SignIn
    wait until element is visible    css:div h2
    input text              css:input[placeholder="Enter email"]            ravi.gajul@test.com
    input password          css:input[placeholder="Password"]   testing
    click button            submit-id
    sleep                   5s
    wait until element is visible    css:div h2
    element text should be          css:div h2    Our Happy Customers
    # Our Happy Customers page
    click link    New Customer
    input text    EmailAddress      alex@test.com
    input text    FirstName         alex
    input text    LastName          gauleski
    input text    City              Atlanta
    select from list by value    StateOrRegion  GA
    select radio button    gender      male
    select checkbox    css:input[value='promos-yes']
    # to ignore error when executing scrolling
    Run Keyword And Ignore Error       scroll element into view            css=button.btn.btn-primary
    click button        Submit
    wait until page contains    Success! New customer added.
    close browser

*** Keywords ***

