*** Settings ***
Library     SeleniumLibrary
Resource    ../Business_Unit_Folder/Business_Unit.resource
#Resource    ../Contact_Folder/Medical_Contact_TestCases.robot
*** Variables ***
#${CONTACT_RELATED_TAB}  xpath=(//a[@id='flexipage_tab__item' and @data-label='Related'])[2]
#${CONTACT_RELATED_TAB}  xpath=//a[@id='flexipage_tab__item' and @data-label='Related']
#${CONTACT_BUSINESS_UNIT_NEW_BUTTON}  xpath=//article[@aria-label="Contact Business Unit"]//button[text()="New"]
#${CONTACT_BUSINESS_UNIT_NEW_BUTTON}  xpath=//li[@data-target-selection-name="sfdc:StandardButton.Contact_Business_Unit__c.New"]//button[contains(.,'New')]
#${CONTACT_BUSINESS_UNIT_NEW_BUTTON}  xpath=(//button[contains(.,'New')])[1]
${NEW_CONTACT_BUSINESS_UNIT_PAGE}  New Contact Business Unit
${CONTACT_BUSINESS_UNIT_COUNTRY_DROWNDOWN_XPATH}  xpath=//div[@data-target-selection-name="sfdc:RecordField.Contact_Business_Unit__c.Country__c"]//button[@aria-label='Country']
${CONTACT_BUSINESS_UNIT_COUNTRY_OPTION_XPATH}  xpath=//div[@data-target-selection-name="sfdc:RecordField.Contact_Business_Unit__c.Country__c"]//lightning-base-combobox-item[@role='option' and @data-value='${COUNTRY_NAME}']
#${SEARCH_BUSINESS_UNIT_DROWNDOWN_XPATH}  xpath=(//input[contains(@id,'combobox-input-')])[2]
${SEARCH_CONTACT_BUSINESS_UNIT_DROWNDOWN_XPATH}  xpath=//div[@data-target-selection-name="sfdc:RecordField.Contact_Business_Unit__c.Business_Unit__c"]//input[contains(@placeholder,'Business Unit')]
#${SEARCH_CONTACT_BUSINESS_UNIT_TEXT}  US-ENT & Surgery
${SEARCH_CONTACT_BUSINESS_UNIT_DROWNDOWN_OPTIONS_XPATH}     xpath=//div[@data-target-selection-name="sfdc:RecordField.Contact_Business_Unit__c.Business_Unit__c"]//lightning-base-combobox-item[@class='slds-media slds-listbox__option slds-media_center slds-listbox__option_entity' and @role='option']
${SEARCH_CONTACT_BUSINESS_UNIT_OPTION_XPATH}      xpath=(//div[@data-target-selection-name="sfdc:RecordField.Contact_Business_Unit__c.Business_Unit__c"]//lightning-base-combobox-item[@class='slds-media slds-listbox__option slds-media_center slds-listbox__option_entity' and @role='option'])[2]
#${CONTACT_BU_SPECIALTY_NAME}        ENT
#${CONTACT_BU_SPECIALTY_OPTION_XPATH}    xpath=//lightning-base-combobox-item[@role='option' and @data-value='${CONTACT_BU_SPECIALTY_NAME}']
##${CONTACT_BU_PRIORITY_NAME}     B
#${CONTACT_BU_PRIORITY_OPTION_XPATH}    xpath=//lightning-base-combobox-item[@role='option' and @data-value='${CONTACT_BU_PRIORITY_NAME}']
#${CONTACT_NAME}    Marguerite McIntosh
#${CONTACT_BU_TABLE_XPATH}        xpath=//article[@aria-label="Contact Business Unit"]//table//tbody//tr

#*** Keywords ***
#Click on Contact Related Tab
#    Sleep    10s
#    Click Button    ${APP_LAUNCHER_BUTTON}
#    Wait Until Element Is Visible    ${SEARCH_APP}    10s
#    Input Text   ${SEARCH_APP}    ${ENTER_CONTACT_TEXT}
#    Sleep    10s
#    Wait Until Element Is Visible    ${RESULT_CONTACT_TEXT}    10s
#    Click Element    ${RESULT_CONTACT_TEXT}
#    Wait Until Element Is Visible   ${CONTACT_PAGE_HEADING}     10s
#    Sleep    5s
#    Click Element   ${FILTER_CONTACT_XPATH}
#    Wait Until Element Is Visible   ${SELECT_ALL_AE_CONTACT_XPATH}     10s
#    Click Element    ${SELECT_ALL_AE_CONTACT_XPATH}
#    Sleep    5s
#    Input Text     ${SEARCH_XPATH}   ${CONTACT_NAME}
#    Press Key    ${SEARCH_XPATH}    \\13
#    Sleep    5s
#    ${SEARCH_CONTACT}   Set Variable    xpath=//a[@title='${CONTACT_NAME}']
##    ${contact_exists}=    Run Keyword And Return Status    Element Should Be Visible    ${SEARCH_CONTACT}
##
##
##    Run Keyword If    ${contact_exists}
#    Click Element    ${SEARCH_CONTACT}
#    Sleep    10s
#    Wait Until Element Is Visible    ${CONTACT_RELATED_TAB}    10s
#    Click Element    ${CONTACT_RELATED_TAB}
#
#
#Create Contact Business Unit
##    Mouse Down    xpath=//span[@title='Contact Business Unit']/ancestor::div[1]/ancestor::div[1]/ancestor::div[1]//following-sibling::div[2]
##    Execute Javascript    Window.scrollTo(0, document.body.scrollHeight);
##    Execute Javascript    arguments[0].scrollIntoView();
#    Sleep    10s
##    Execute JavaScript    window.scrollBy(0, 300);
##    Execute JavaScript    document.evaluate("//article[@aria-label='Contact Business Unit']//button[text()='New']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView({ behavior: 'smooth', block: 'center' });
#    FOR    ${index}    IN RANGE    10
#        Log To Console   Index is: ${index}
#        ${visible}=    Run Keyword And Return Status    Element Should Be Visible   xpath=//article[@aria-label="Contact Business Unit"]
#        Exit For Loop If    ${visible}
#        Execute JavaScript    window.scrollBy(0, 200);
#        Sleep    5s
#    END
#    ${contact_bu_rows}=    Get Element Count    xpath=//article[@aria-label="Contact Business Unit"]//table//tbody//tr
#    Log To Console    Row elements: ${contact_bu_rows}
#    ${match_found}=    Set Variable    False
#    IF    ${contact_bu_rows} > 0
#        FOR    ${index}    IN RANGE    1    ${contact_bu_rows + 1}
##            ${contact_bu_row_index_xpath}=    Set Variable    xpath=//article[@aria-label="Contact Business Unit"]//table//tbody//tr[${index}]
#            ${row_text}=    Get Text    xpath=//article[@aria-label="Contact Business Unit"]//table//tbody//tr[${index}]
#            Log To Console    Row: ${row_text}
#            ${specialty_text}=          Get Text    xpath=//article[@aria-label="Contact Business Unit"]//table//tbody//tr[${index}]/td[3]
#            ${priority_text}=   Get Text    xpath=//article[@aria-label="Contact Business Unit"]//table//tbody//tr[${index}]/td[4]
#            ${country_text}=    Get Text    xpath=//article[@aria-label="Contact Business Unit"]//table//tbody//tr[${index}]/td[5]
#            ${is_specialty_match}=    Run Keyword And Return Status    Should Be Equal     ${specialty_text}      ${CONTACT_BU_SPECIALTY_NAME}
#            ${is_priority_match}=    Run Keyword And Return Status    Should Be Equal    ${priority_text}    ${CONTACT_BU_PRIORITY_NAME}
#            ${is_country_match}=     Run Keyword And Return Status    Should Be Equal    ${country_text}    ${COUNTRY_NAME}
#
#            ${match_found}=    Evaluate    ${is_specialty_match} and ${is_priority_match} and ${is_country_match}
#            Exit For Loop If    ${match_found}
#        END
#    END
#    IF    not ${match_found}
#            Sleep    5s
#            Wait Until Element Is Visible    ${CONTACT_BUSINESS_UNIT_NEW_BUTTON}    10s
#            Click Element    ${CONTACT_BUSINESS_UNIT_NEW_BUTTON}
#            Wait Until Page Contains    ${NEW_CONTACT_BUSINESS_UNIT_PAGE}   10s
#            Click Button    ${CONTACT_BUSINESS_UNIT_COUNTRY_DROWNDOWN_XPATH}
#            Click Element   ${CONTACT_BUSINESS_UNIT_COUNTRY_OPTION_XPATH}
#            Click Button    ${CONTACT_SPECIALTY_DROPDOWN_XPATH}
#            Click Element   ${CONTACT_BU_SPECIALTY_OPTION_XPATH}
#            Click Button    ${CONTACT_PRIORITY_DROPDOWN_XPATH}
#            Click Element   ${CONTACT_BU_PRIORITY_OPTION_XPATH}
#            Input Text   ${SEARCH_CONTACT_BUSINESS_UNIT_DROWNDOWN_XPATH}     ${BU_NAME}
#            Sleep    5s
#            Wait Until Element Is Visible   ${SEARCH_CONTACT_BUSINESS_UNIT_DROWNDOWN_OPTIONS_XPATH}  10s
#            Click Element   ${SEARCH_CONTACT_BUSINESS_UNIT_OPTION_XPATH}
#            Click Button    ${SAVE_BUTTON_XPATH}
#    ELSE
#            Log    Matching Contact Business Unit already exists. Skipping creation.
#    END