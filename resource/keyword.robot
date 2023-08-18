*** Settings ***
Library             SeleniumLibrary
Library             SeleniumLibrary
Library             RPA.Desktop
Library             Collections
Library             Telnet
Library             Process
Library             String



*** Variables ***
${CHROME_DRIVER_PATH}   chromedriver/chromedriver.exe

${BROWSER}      Chrome

${URL}          https://www.bosch-home.com/us/kitchen-planning-resources?fbclid
*** Keywords ***
Test open Browser
    # [Arguments]   ${locator}  
    Open Browser    ${URL}    Chrome  executable_path=${CHROME_DRIVER_PATH}
    Maximize Browser Window
    Wait Until Element Is Visible    //a[@class='cmpboxbtn cmpboxbtnyes cmptxt_btn_yes']    10
    Click Element    //a[@class='cmpboxbtn cmpboxbtnyes cmptxt_btn_yes']
    Wait Until Element Is Visible    //*[contains(text(),'Start from scratch')]    10
    Click Element    //*[contains(text(),'Start from scratch')]
    Wait Until Page Contains Element    //*[contains(text(),'Change package')]    20

# testcase 1
Verify that user can choose the correct appliances by product hotspot
    # [Arguments]   ${locator}  ${txt_value}
    Click Element    //button[@class='zv-trigger zv-trigger-hotspot zv-trigger-250045620 c00177 has-tooltip']
    Wait Until Element Is Visible    //div[@class= 'c00181 zv-section']    20
    Wait Until Element Contains    //span[@class= 'c00185 zv-text c00184 zv-section-headline']    Dishwasher

# testcase 2

Verify that the image of choosen item is appear in the product stage picture
    # [Arguments]   ${locator}  ${txt_value}
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
    # [Arguments]   ${locator}  ${txt_value}
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
    Element Should Contain    //span[@class='c00117 zv-text c00114']    0

# testcase 4

Verify that the choosen items have been added to the shopping cart
    Click Element    //span[contains(text(),'My Kitchen')]
    # thay đổi nếu cart có nhiều hơn 1 item
    Element Should Contain
    ...    xpath=/html/body/div[4]/div[3]/div/div/div/div[2]/div/div/div/div/div/div[3]/div/div/div/div/div/div/div/div[3]/div/div[4]/div[1]/div/div[3]/div[2]/div/div
    ...    SPE68B55UC

# testcase 5

# ====================================================

# Get PDF Content
#     [Documentation]    Extracts text from a PDF file using pdfplumber
#     ${pdf_path}=    Set Variable    https://media3.bosch-home.com/Documents/16865668_SPE68B55UC_Spec_Sheet.pdf
#     ${pdf_content}=    Run Keyword And Return Status    Extract PDF Text    ${pdf_path}
#     RETURN    ${pdf_content}

# Extract PDF Text
#     [Arguments]    ${pdf_path}
#     # Use the pdfplumber command line tool
#     ${pdf_content}=    Run Keyword And Return Status
#     ...    Execute Command
#     ...    pdfplumber ${pdf_path}
#     RETURN    ${pdf_content.stdout}

Get PDF Title
    [Documentation]    Extracts the title of a PDF file using pdfplumber
    ${pdf_path}=    Set Variable    https://media3.bosch-home.com/Documents/16865668_SPE68B55UC_Spec_Sheet.pdf   
    ${pdf_title}=    Run Keyword And Return Status    Execute Command    pdfplumber ${pdf_path} --metadata   # Use the pdfplumber command line tool
    ${metadata}=    Evaluate    json.loads('''${pdf_title}''')
    ${title}=    Run Keyword If    "'Title:' in ${metadata}"    Get Metadata Value    ${metadata}    Title:
    [Return]    ${title}

Get Metadata Value
    [Arguments]    ${metadata}    ${key}
    @{lines}=    Split To Lines    ${metadata}
    FOR    ${line}    IN    @{lines}
        Run Keyword If    "${key}" in ${line}    Split String    ${line}    ${key}    SEPARATOR=:
    END
Get PDF Content
    [Documentation]    Extracts text content of a PDF file using pdfplumber
    ${pdf_path}=    Set Variable    path/to/your/file.pdf   # Replace with the actual PDF path
    ${pdf_content}=    Run Keyword And Return Status    Execute Command    pdfplumber ${pdf_path} text   # Use the pdfplumber command line tool
    [Return]    ${pdf_content.stdout}