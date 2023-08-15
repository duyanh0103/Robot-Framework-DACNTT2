*** Settings ***
Documentation       Simple example using SeleniumLibrary.

Library             SeleniumLibrary
Library             RPA.Desktop
# Library    RPA.Browser.Selenium
# Library    RPA.Browser.Selenium


*** Variables ***
${BROWSER}      Chrome

${URL}          https://www.bosch-home.com/us/kitchen-planning-resources?fbclid


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
    # Wait for the PDF viewer to appear, adjust the XPath or condition accordingly
    # Switch to the new tab or window containing the PDF
    ${handles}=    Get Window Handles
    ${pdf_handle}=    Set Variable    ${handles}[1]    # Index of the new tab/window
    Switch Window    ${pdf_handle}

    # Verify that the PDF content is visible or loaded
    Wait Until Element Is Visible    //embed[@type='application/pdf']


*** Keywords ***
Test open Browser
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Wait Until Element Is Visible    //a[@class='cmpboxbtn cmpboxbtnyes cmptxt_btn_yes']    10
    Click Element    //a[@class='cmpboxbtn cmpboxbtnyes cmptxt_btn_yes']
    Wait Until Element Is Visible    //*[contains(text(),'Start from scratch')]    10
    Click Element    //*[contains(text(),'Start from scratch')]
    Wait Until Page Contains Element    //*[contains(text(),'Change package')]    20
# testcase 1

Verify that user can choose the correct appliances by product hotspot
    Click Element    //button[@class='zv-trigger zv-trigger-hotspot zv-trigger-250045620 c00177 has-tooltip']
    Wait Until Element Is Visible    //div[@class= 'c00181 zv-section']    20
    Wait Until Element Contains    //span[@class= 'c00185 zv-text c00184 zv-section-headline']    Dishwasher

# testcase 2

Verify that the image of choosen item is appear in the product stage picture
    Wait Until Element Is Visible    //div[@class='zv-product zv-product-spe68b55uc c00288']
    # click element in the parent div
    Click Element
    ...    //div[@class='zv-product zv-product-spe68b55uc c00288']//button[@class='c00335 zv-button c00333 zv-product-button-add-to-summary']
    Wait Until Element Is Visible
    ...    //div[@class='zv-product zv-product-spe68b55uc c00288 is-selected']//span[contains(text(),'Remove from My Kitchen')]
    ...    10
    Wait Until Element Is Visible
    ...    //div[@class='zv-product-stage-products-container c00123']//img[@alt="Selected Dishwasher. 800 Series Dishwasher 17 3/4'' Stainless steel SPE68B55UC"]
    ...    10
    Wait Until Element Does Not Contain    //span[@class='c00117 zv-text c00114']    0

# # Find all product elements using a common class

# @{products} =    Get WebElements    //div[@class='zv-product zv-product-spe68b55uc c00288']

# # Iterate through the list of product elements

# FOR    ${product}    IN    ${products}
#    # Check if the product matches a certain criteria, adjust the XPath or condition accordingly
#    ${product_name}    Get Text    ${product}/h2
#    IF    '${product_name}' == 'Dynamic Product'    Click Element    ${product}

# END

# testcase 3

Verify that user can remove the choosen item
    Wait Until Element Is Visible
    ...    //div[@class='zv-product zv-product-spe68b55uc c00288 is-selected']//span[contains(text(),'Remove from My Kitchen')]
    ...    10
    # có thể thay đổi tăng giá trị lên
    Click Button
    ...    xpath=//html/body/div[4]/div[3]/div/div/div/div[2]/div/div/div/div/div/div[3]/div/div/div/div/div/div/div/div[3]/div/div[6]/div/div[2]/div[1]/div/div/div[4]/button
    Wait Until Element Is Visible
    ...    //div[@class='zv-product zv-product-spe68b55uc c00288']//span[contains(text(),'Add to My Kitchen')]
    ...    10
    Wait Until Element Is Not Visible
    ...    //div[@class='zv-product-stage-products-container c00123']//img[@alt="Selected Dishwasher. 800 Series Dishwasher 17 3/4'' Stainless steel SPE68B55UC"]
    ...    10
    Wait Until Element Contains    //span[@class='c00117 zv-text c00114']    0

Verify that the choosen items have been added to the shopping cart
    Click Element    //span[contains(text(),'My Kitchen')]
    # thay đổi nếu cart có nhiều hơn 1 item
    Wait Until Element Contains
    ...    xpath=/html/body/div[4]/div[3]/div/div/div/div[2]/div/div/div/div/div/div[3]/div/div/div/div/div/div/div/div[3]/div/div[4]/div[1]/div/div[3]/div[2]/div/div
    ...    SPE68B55UC
