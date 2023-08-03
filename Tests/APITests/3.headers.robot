*** Settings ***
Library    RequestsLibrary
Library    Collections

# robot -i get-cert Tests/APITests/3.headers.robot

*** Variables ***
${base_url}         http://postman-echo.com

*** Test Cases ***
Get With headers
    [Tags]  get     get-cert
    ${headers}=     create dictionary   my-sample-header=testheader
    Create Session    headerssession   ${base_url}     ${headers}
    ${resp}=  GET On Session  headerssession  /headers    expected_status=200
    Should Be Equal As Strings  ${resp.status_code}  200
    Should Be Equal As Strings  ${resp.json()['headers']['my-sample-header']}  testheader




