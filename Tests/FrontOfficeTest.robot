*** Settings ***
Documentation       This is to practise robotframework testing on front-office app
Resource            ../Resources/PO/FrontOfficePage.robot
Test Setup          Begin Web Test
*** Variables ***
${Browser}      chrome
${URL}          https://automationplayground.com/front-office/
*** Test Cases ***
Should be able to verify Our Amazing Team header on Team Page
      Verify "Our Amazing Team" header is displayed on navigating to team page  ${BROWSER}  ${URL}

