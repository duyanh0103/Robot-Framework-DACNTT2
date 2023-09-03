*** Settings ***
Documentation       TC00 Setup open and check website.
Resource            ../resource/keyword.robot

Library             SeleniumLibrary

# Test Setup   ${SETUP}   
# Test Teardown  ${TEARDOWN}
*** Test Cases ***
TC00 Setup open and check website
    [Tags]    test0
    Test open Browser
    

