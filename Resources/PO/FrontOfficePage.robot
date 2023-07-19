*** Settings ***
Resource    ../Common/Common.robot
Library    SeleniumLibrary
*** Variables ***
*** Keywords ***
Verify "Our Amazing Team" header is displayed on navigating to team page
    [Arguments]     ${Browser}      ${URL}
    Launch Browser and maximize     ${Browser}
    go to                             ${URL}
    click link                        Team
    wait until page contains          Our Amazing Team