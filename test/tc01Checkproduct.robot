*** Settings ***
Documentation       TC01 Verify that user can choose the correct appliances by product hotspot.
Resource            ../resource/keyword.robot

Library             SeleniumLibrary

Test Setup   ${SETUP}   
Test Teardown  ${TEARDOWN}
*** Test Cases ***
TC01 Verify that user can choose the correct appliances by product hotspot
    [Tags]    test1
    # Test open Browser
    [Setup]  ${SETUP}
    Verify that user can choose the correct appliances by product hotspot
    [Teardown]   ${TEARDOWN}