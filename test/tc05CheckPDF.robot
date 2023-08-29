*** Settings ***
Documentation       TC04 Verify that the choosen items have been added to the shopping cart.
Resource            ../resource/keyword.robot

Library             SeleniumLibrary

Test Setup   ${SETUP}   
Test Teardown  ${TEARDOWN}
*** Test Cases ***
TC05 Verify that the product detail of the choosen items appears PDF file
    [Tags]    test5
    [Setup]   ${SETUP}
    Verify that user can choose the correct appliances by product hotspot
    Verify that the image of choosen item is appear in the product stage picture
    Verify that the choosen items have been added to the shopping cart
    Verify that the product detail of the choosen items appears PDF file
    [Teardown]   ${TEARDOWN}