*** Settings ***
Documentation       TC04 Verify that the choosen items have been added to the shopping cart.
Resource            ../resource/keyword.robot

Library             SeleniumLibrary

Test Setup   ${SETUP}   
Test Teardown  ${TEARDOWN}
*** Test Cases ***
TC04 Verify that the choosen items have been added to the shopping cart
    [Tags]    test4
    [Setup]   ${SETUP}
    Verify that user can choose the correct appliances by product hotspot
    Verify that the image of choosen item is appear in the product stage picture
    Verify that the choosen items have been added to the shopping cart
    [Teardown]   ${TEARDOWN}
