*** Settings ***
Library    SeleniumLibrary
*** Variables ***

*** Keywords ***
Launch Browser and maximize
    # TODO for demo purposes
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

*** Keywords ***
Return One Value
    [Arguments]    ${arg}
    [Documentation]    Return a value unconditionally.
    ...                Notice that keywords after RETURN are not executed.
    ${value} =    Convert To Upper Case    ${arg}
    RETURN    ${value}
    Fail    Not executed

Return Three Values
    [Documentation]    Return multiple values.
    RETURN    a    b    c

Conditional Return
    [Arguments]    ${arg}
    [Documentation]    Return conditionally.
    Log    Before
    IF    ${arg} == 1
        Log    Returning!
        RETURN
    END
    Log    After

Find Index
    [Arguments]    ${test}    ${items}
    [Documentation]    Advanced example involving FOR loop, inline IF and @{list} variable syntax.
    FOR    ${index}    ${item}    IN ENUMERATE    @{items}
        IF    $item == $test    RETURN    ${index}
    END
    RETURN    ${-1}