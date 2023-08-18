*** Settings ***
Documentation       Simple example using SeleniumLibrary.
Resource            ../resource/keyword.robot

Library             SeleniumLibrary
Library             RPA.Desktop
Library             Collections
Library             Telnet

*** Test Cases ***
Verify that user can choose the correct appliances by product hotspot
    [Tags]    test1
    Test open Browser
    Verify that user can choose the correct appliances by product hotspot

Verify that the image of choosen item is appear in the product stage picture
    [Tags]    test2
    Test open Browser
    Verify that user can choose the correct appliances by product hotspot
    Verify that the image of choosen item is appear in the product stage picture

Verify that user can remove the choosen item
    [Tags]    test3
    Test open Browser
    Verify that user can choose the correct appliances by product hotspot
    Verify that the image of choosen item is appear in the product stage picture
    Verify that user can remove the choosen item

Verify that the choosen items have been added to the shopping cart
    [Tags]    test4
    Test open Browser
    Verify that user can choose the correct appliances by product hotspot
    Verify that the image of choosen item is appear in the product stage picture
    Verify that the choosen items have been added to the shopping cart

Verify that the product detail of the choosen items appears PDF file
    [Tags]    test5
    Test open Browser
    Verify that user can choose the correct appliances by product hotspot
    Verify that the image of choosen item is appear in the product stage picture
    Verify that the choosen items have been added to the shopping cart
    Wait Until Element Is Visible
    ...    //a[@href='https://media3.bosch-home.com/Documents/16865668_SPE68B55UC_Spec_Sheet.pdf']
    Click Element
    ...    //a[@href='https://media3.bosch-home.com/Documents/16865668_SPE68B55UC_Spec_Sheet.pdf']//span[contains(text(),'Product details')]

    # Switch to the new tab or window containing the PDF
    ${handles}=    Get Window Handles
    ${pdf_handle}=    Set Variable    ${handles}[1]    # Index of the new tab/window
    Switch Window    ${pdf_handle}

    # # Extract PDF title and content
    # ${pdf_title}=    Get PDF Title
    # ${pdf_content}=    Get PDF Content

    # # Verify PDF title and content
    # Should Be Equal As Strings    ${pdf_title}    18" Recessed Handle ADA-compliant Dishwasher
    # Should Contain    ${pdf_content}    800 Series – Stainless Steel SPE68B55UC


    # Verify that the PDF content is visible or loaded
    Wait Until Element Is Visible    //embed[@type='application/pdf']



