*** Settings ***
Documentation       Simple example using SeleniumLibrary.
Resource            ../resource/keyword.robot

Library             SeleniumLibrary
Library             RPA.Desktop
Library             Collections
Library             Telnet
Library             DataDriver

Test Setup   ${SETUP}   
Test Teardown  ${TEARDOWN}
*** Test Cases ***
TC01 Verify that user can choose the correct appliances by product hotspot
    [Tags]    test1
    # Test open Browser
    [Setup]  ${SETUP}
    Verify that user can choose the correct appliances by product hotspot
    [Teardown]   ${TEARDOWN}
TC02 Verify that the image of choosen item is appear in the product stage picture
    [Tags]    test2
    [Setup]   ${SETUP}
    Verify that user can choose the correct appliances by product hotspot
    Verify that the image of choosen item is appear in the product stage picture
    [Teardown]   ${TEARDOWN}
TC03 Verify that user can remove the choosen item
    [Tags]    test3
    [Setup]   ${SETUP}
    Verify that user can choose the correct appliances by product hotspot
    Verify that the image of choosen item is appear in the product stage picture
    Verify that user can remove the choosen item
    [Teardown]   ${TEARDOWN}
TC04 Verify that the choosen items have been added to the shopping cart
    [Tags]    test4
    Test open Browser
    Verify that user can choose the correct appliances by product hotspot
    Verify that the image of choosen item is appear in the product stage picture
    Verify that the choosen items have been added to the shopping cart

TC05 Verify that the product detail of the choosen items appears PDF file
    [Tags]    test5
    Test open Browser
    Verify that user can choose the correct appliances by product hotspot
    Verify that the image of choosen item is appear in the product stage picture
    Verify that the choosen items have been added to the shopping cart
    Verify that the product detail of the choosen items appears PDF file

    