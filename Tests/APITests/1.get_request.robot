*** Settings ***
Library    RequestsLibrary
Library    Collections

# robot Tests/APITests/1.get_request.robot

*** Variables ***
${base_url}         http://postman-echo.com


*** Test Cases ***
01 Get Request
        create session    testSession   ${base_url}     verify=true
        ${params}=  create dictionary    test=123
        ${response}=      GET On Session   testSession   /get   ${params}   expected_status=200
        #Verify status is 200
        status should be    200     ${response}
        # verify reason is OK
        Should Be Equal As Strings  OK  ${response.reason}
        # verify json path in response is 123 (response.args.test)
        should be equal as strings      123     ${response.json()}[args][test]
        set suite variable   ${Variable_TC01}   TestValue
        # This will log to Console
        log to console     ${Variable_TC01}
        log             ${response}

02 Passing Parameter Value from Test 01 to Test Case 02
        # This will log to Report
        log    ${Variable_TC01}
