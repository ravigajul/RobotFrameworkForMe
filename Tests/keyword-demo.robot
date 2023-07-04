*** Settings ***
Documentation       Test suite to demo the keywords
Resource            ../Resources/PO/HomePage.robot
Resource            ../Resources/Common/Common.robot
Suite Setup    Insert Test Data
Test Setup      Begin Web Test
Test Teardown   End Web Test
Suite Teardown    Cleaning up Test Data
# Run the script
# robot -d Results Tests/keyword-demo.robot
*** Variables ***
${BROWSER}     chrome
${URL}         https://automationplayground.com/crm/
*** Test Cases ***
Test Case to create a new customer
    Launch Browser and maximize     ${BROWSER}
    Login to the application and maximize the browser   ${URL}
    Create a New Customer

Test Case to create a another new customer
    Launch Browser and maximize     ${BROWSER}
    Login to the application and maximize the browser   ${URL}
    Create a New Customer
