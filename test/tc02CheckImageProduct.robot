*** Settings ***
Documentation       TC02 Verify that the image of choosen item is appear in the product stage picture.
Resource            ../resource/keyword.robot

Library             SeleniumLibrary

Test Setup   ${SETUP}   
Test Teardown  ${TEARDOWN}
*** Test Cases ***
TC02 Verify that the image of choosen item is appear in the product stage picture
    [Tags]    test2
    [Setup]   ${SETUP}
    Verify that user can choose the correct appliances by product hotspot
    Verify that the image of choosen item is appear in the product stage picture
    [Teardown]   ${TEARDOWN}