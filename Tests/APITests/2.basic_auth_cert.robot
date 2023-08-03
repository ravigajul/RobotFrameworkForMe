*** Settings ***
Library    RequestsLibrary
Library    Collections

# robot -i get-cert Tests/APITests/2.basic_auth_cert.robot

*** Variables ***
${base_url}         http://postman-echo.com


*** Test Cases ***
Get With Auth
    [Tags]  get     get-cert
    ${auth}=  Create List  user   passwd
    Create Session    httpbin    https://httpbin.org     auth=${auth}   verify=${CURDIR}${/}cacert.pem
    ${resp}=  GET On Session  httpbin  /basic-auth/user/passwd
    Should Be Equal As Strings  ${resp.status_code}  200
    Should Be Equal As Strings  ${resp.json()['authenticated']}  True




