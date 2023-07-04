*** Settings ***

# robot -d Results  Tests/Variables.robot
*** Variables ***
${Browser}         Chrome
@{intArray}        0   1   2

*** Test Cases ***
Demonstrate Variables assignment and retrieval
    log    ${Browser}
    log    ${intArray}[0]
    log    ${intArray}[1]
    log    ${intArray}[2]

Alternate way of variables assignment and retrieval
    @{strArray}         set variable    Ravi       Kumar       Gajul
    log    ${strArray}[0]
    log    ${strArray}[1]
    log    ${strArray}[2]

Alternate way of variables assignment and retrieval
    @{strArray}        create list    Gajul       Kumar       Ravi
    log    ${strArray}[0]
    log    ${strArray}[1]
    log    ${strArray}[2]