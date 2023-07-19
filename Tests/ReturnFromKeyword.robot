*** Settings ***
Library           String
Resource            ../Resources/Common/Common.robot

# robot -d Results Tests/ReturnFromKeyword.robot

*** Test Cases ***
One return value
    ${ret} =    Return One Value    argument
    Should Be Equal    ${ret}    ARGUMENT

Multiple return values
    ${a}    ${b}    ${c} =    Return Three Values
    Should Be Equal    ${a}, ${b}, ${c}    a, b, c

Conditional return
    Conditional Return    1
    Conditional Return    2

Advanced
    @{list} =    Create List    foo    bar    baz
    ${index} =    Find Index    bar    ${list}
    Should Be Equal    ${index}    ${1}
    ${index} =    Find Index    non existing    ${list}
    Should Be Equal    ${index}    ${-1}