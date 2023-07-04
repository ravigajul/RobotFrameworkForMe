*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}      https://google.com
*** Keywords ***
Login to the application and maximize the browser
    [Arguments]    ${URL}
    go to          ${URL}
    maximize browser window
    click link              id:SignIn
    wait until element is visible    css:div h2
    input text              css:input[placeholder="Enter email"]            ravi.gajul@test.com
    input password          css:input[placeholder="Password"]   testing
    click button            submit-id
    sleep                   5s
    wait until element is visible    css:div h2
    element text should be          css:div h2    Our Happy Customers
Create a new Customer
     # Our Happy Customers page
    click link    id:new-customer
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
Close the browser
    close browser
    Log    Stopping to Execute Test Case 1