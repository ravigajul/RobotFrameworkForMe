*** Settings ***
Library    SeleniumLibrary
*** Variables ***

*** Keywords ***
Launch Browser and maximize
    [Arguments]     ${BROWSER}
    open browser    about:blank        ${BROWSER}
    maximize browser window
Begin Web Test
    log    Test Started

End Web Test
    close browser
    log     Test Ended

Insert Test Data
    log     Inserting test data in this sectio

Cleaning up Test Data
    log     cleaning test data in this section