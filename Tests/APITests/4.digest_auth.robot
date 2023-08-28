*** Settings ***
Library    RequestsLibrary
Library    Collections

# robot -i digest-auth Tests/APITests/4.digest_auth.robot

*** Variables ***
${base_url}         http://postman-echo.com

*** Test Cases ***
Get With digest Auth
    [Tags]  get     digest-Auth
    ${auth}=        create dictionary    Digest username=postman
     ...    realm=Users
     ...    nonce=ni1LiL0O37PRRhofWdCLmwFsnEtH1lew
     ...    uri=/digest-auth
     ...    response=254679099562cf07df9b6f5d8d15db44
     ...    opaque=
     ${headers}     create dictionary    Authorization: ${auth}
    Create Session    digestAuth   ${base_url}    ${headers}    ${auth}
    ${resp}=  GET On Session  digestAuth  /digest-auth    expected_status=200
    Should Be Equal As Strings  ${resp.status_code}  200
    Should Be Equal as Strings   ${resp.reason}     OK
    Should Be Equal as Strings    ${resp.json()['authenticated']}  true




