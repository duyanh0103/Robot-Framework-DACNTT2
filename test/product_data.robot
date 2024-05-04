*** Settings ***
Documentation       Data Driven TestCase using SeleniumLibrary.

Resource            ../resource/keywordDataDriven.robot
Library             SeleniumLibrary
Library             Collections
Library             DataDriver    /product_data.csv

Test Template       Verify Product Name


*** Test Cases ***
TC6 Data driven check product name in hotspot sidebar ${product_name}


*** Keywords ***
Verify Product Name
    [Arguments]    ${product_name}
    Test open Browser
    Verify that user can choose the correct appliances by product hotspot
    ${web_product_names}=    Get Web Product Names
    Sleep    5
    Should Contain    ${web_product_names}    ${product_name}

    Log    Verification for product: ${product_name} successful
    Close Browser
    # Implement your verification logic here, e.g., search for the product name on a webpage
    # You can use SeleniumLibrary keywords to interact with the web page

Get Web Product Names
    # scroll down till the end of the sidebar
    FOR    ${end_point}    IN RANGE      1    42    1
        ${end_points}=    Get WebElements    xpath = /html/body/div[4]/div[3]/div/div/div/div[2]/div/div/div/div/div/div[3]/div/div/div/div/div/div/div/div[3]/div/div[6]/div/div[2]/div[${end_point}]
        Scroll To Load More Data    ${end_points}
        
    END
    ${product_elements}=    Get WebElements    //*[@class= 'zv-product-attribute-label c00433 zv-text']
    ${product_names}=    Create List
    Sleep    5
    # get product's name
    FOR    ${element}    IN    @{product_elements}
        ${product_name}=    Get Text    ${element}
        Append To List    ${product_names}    ${product_name}
    END
    RETURN    ${product_names}

Scroll To Load More Data
    [Arguments]    ${elements}
    FOR    ${element}    IN    @{elements}
        Scroll Element Into View    ${element}
    END

# *** Keywords ***
# Verify Ajax Product Name 
#     [Arguments]    ${product_name}
#     Test open Browser
#     Verify that user can choose the correct appliances by product hotspot

#     # Send AJAX request using Prototype's Ajax.Request
#     Send Prototype Ajax Request    ${product_name}

#     ${web_product_names}=    Get Web Product Names
#     Sleep    5
#     Should Contain    ${web_product_names}    ${product_name}

#     Log    Verification for product: ${product_name} successful
#     Close Browser

# Send Prototype Ajax Request
#     [Arguments]    ${product_name}
#     # Initialize prototypeAjaxCompleted variable
#     # ${prototypeAjaxCompleted} =    Set Variable    ${False}
#     # Execute JavaScript for AJAX request
#     Execute JavaScript
#     ...    new Ajax.Request('https://ev-co.zoovu.com/v1/CollectAdvisorEvent', {
#     ...    method: 'get',
#     ...    parameters: {Check_product: arguments[0]},
#     ...    onComplete: function(response) {
#     ...    // Process AJAX response if needed
#     ...    // Set prototypeAjaxCompleted to true
#     ...    window.prototypeAjaxCompleted = true;
#     ...    }
#     ...    });

#     # Wait for Prototype AJAX complete
#     Wait For Prototype Ajax Complete

# Wait For Prototype Ajax Complete
#     [Timeout]    30 seconds
#     Execute JavaScript    Ajax.Responders.register({onComplete: function() {window.prototypeAjaxCompleted = true;}});
#     Wait Until Keyword Succeeds    30s    1s    Check Prototype Ajax Completed

# Check Prototype Ajax Completed
#     ${prototypeAjaxCompleted}=    Execute JavaScript    return window.prototypeAjaxCompleted;
#     # Reset the prototypeAjaxCompleted flag for next AJAX request
#     IF    not ${prototypeAjaxCompleted}    Fail    Prototype AJAX not completed

# Get Web Product Names
#     # ${product_elements}=    Get WebElements    //*[@class= 'zv-product-attribute-label c00445 zv-text']
#     # ${product_names}=    Create List
#     # Sleep    5
#     # # get product's name
#     # FOR    ${element}    IN    @{product_elements}
#     #     ${product_name}=    Get Text    ${element}
#     #     Append To List    ${product_names}    ${product_name}
#     # END
#     # RETURN    ${product_names}
#     ${response} =    Execute JavaScript    return response.responseText;
#     ${product_names} =    Evaluate    JSON.parse('${response}').product_names
#     [Return]    ${product_names}
