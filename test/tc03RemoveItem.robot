*** Settings ***
Documentation       TC03 Verify that user can remove the choosen item.
Resource            ../resource/keyword.robot

Library             SeleniumLibrary

Test Setup   ${SETUP}   
Test Teardown  ${TEARDOWN}
*** Test Cases ***
TC03 Verify that user can remove the choosen item
    [Tags]    test3
    [Setup]   ${SETUP}
    Verify that user can choose the correct appliances by product hotspot
    Verify that the image of choosen item is appear in the product stage picture
    Verify that user can remove the choosen item
    [Teardown]   ${TEARDOWN}