*** Settings ***
Library     SeleniumLibrary
Resource    ../Contact_Business_Unit_Folder/Contact_Business_Unit.resource
Resource    ../Marketing_Cycle_Folder/Marketing_Cycle.resource

*** Variables ***
${CONTACT_TCL_NEW_BUTTON}       xpath=//li[@data-target-selection-name="sfdc:StandardButton.Target_Customer_List__c.New"]//button[text()="New"]
${NEW_CONTACT_TCL_PAGE}  New Target Customer List
${CONTACT_PRIORITY_OPTION_XPATH}        xpath=//div[@data-target-selection-name="sfdc:RecordField.Target_Customer_List__c.Priority__c"]//span[@title="B"]
#${SEARCH_CONTACT_TCL_DROWNDOWN_XPATH}  xpath=(//input[contains(@id,'combobox-input-')])[2]
#${SEARCH_CONTACT_TCL_TEXT}  US-ENT & Surgery
#${SEARCH_CONTACT_TCL_DROWNDOWN_OPTIONS_XPATH}     xpath=//lightning-base-combobox-item[@class='slds-media slds-listbox__option slds-media_center slds-listbox__option_entity' and @role='option']
#${SEARCH_CONTACT_TCL_DROWNDOWN_OPTIONS_XPATH}     xpath=//div[@data-target-selection-name="sfdc:RecordField.Target_Customer_List__c.Target__c"]//lightning-base-combobox-item[@class='slds-media slds-listbox__option slds-media_center slds-listbox__option_entity' and @role='option']
#${SEARCH_CONTACT_TCL_OPTION_XPATH}      xpath=(//lightning-base-combobox-item[@class='slds-media slds-listbox__option slds-media_center slds-listbox__option_entity' and @role='option'])[2]
${SEARCH_CONTACT_DROPDOWN_XPATH}    xpath=//input[@placeholder='Search Contacts...']
${TCL_SEARCH_CONTACT_DROPDOWN_OPTIONS_XPATH}   xpath=//div[@data-target-selection-name="sfdc:RecordField.Target_Customer_List__c.Customer__c"]//lightning-base-combobox-item[@class='slds-media slds-listbox__option slds-media_center slds-listbox__option_entity' and @role='option']
${CONTACT_NAME}     Marguerite McIntosh
${TCL_SEARCH_CONTACT_OPTION_XPATH}     xpath=//div[@data-target-selection-name="sfdc:RecordField.Target_Customer_List__c.Customer__c"]//lightning-base-combobox-formatted-text[@title="${CONTACT_NAME}"]
${SEARCH_USER_DROPDOWN_XPATH}    xpath=//input[@placeholder='Search People...']
${SEARCH_USER_TEXT}     QA Team
${TCL_SEARCH_USER_DROPDOWN_OPTIONS_XPATH}   xpath=//div[@data-target-selection-name="sfdc:RecordField.Target_Customer_List__c.Target__c"]//lightning-base-combobox-item[@class='slds-media slds-listbox__option slds-media_center slds-listbox__option_entity' and @role='option']
#${TCL_SEARCH_USER_OPTION_XPATH}     xpath=(//div[@data-target-selection-name="sfdc:RecordField.Target_Customer_List__c.Target__c"]//lightning-base-combobox-item[@class='slds-media slds-listbox__option slds-media_center slds-listbox__option_entity' and @role='option'])[2]
${TCL_SEARCH_USER_OPTION_XPATH}     xpath=//div[@data-target-selection-name="sfdc:RecordField.Target_Customer_List__c.Target__c"]//lightning-base-combobox-formatted-text[@title="${SEARCH_USER_TEXT}"]
${TCL_ACTIVE_CHECKBOX_XPATH}    xpath=//div[@data-target-selection-name="sfdc:RecordField.Target_Customer_List__c.Active__c"]//input[@name='Active__c']
${TCL_APPROVAL_STATUS_DROPDOWN_XPATH}   xpath=//button[@aria-label='Approval Status']
${TCL_APPROVAL_STATUS_OPTION_XPATH}   xpath=//lightning-base-combobox-item[@role='option' and @data-value='Activated']
${TCL_CALCULATE_FREQUENCY_CHECKBOX_XPATH}   xpath=//input[@name='Calculate_Frequency_From_Cycle__c']
${TCL_MARKETING_CYCLE_DROPDOWN_XPATH}   xpath=//input[contains(@placeholder,'Search Marketing Cycle...')]
#${TCL_MARKETING_CYCLE_TEXT}     US-M
${TCL_MARKETING_CYCLE_OPTIONS_XPATH}     xpath=//div[@data-target-selection-name="sfdc:RecordField.Target_Customer_List__c.Marketing_Cycle__c"]//lightning-base-combobox-item[@class='slds-media slds-listbox__option slds-media_center slds-listbox__option_entity' and @role='option']
${TCL_MARKETING_CYCLE_OPTION_XPATH}      xpath=(//div[@data-target-selection-name="sfdc:RecordField.Target_Customer_List__c.Marketing_Cycle__c"]//lightning-base-combobox-item[@class='slds-media slds-listbox__option slds-media_center slds-listbox__option_entity' and @role='option'])[2]
${TCL_COUNTRY_DROPDOWN_XPATH}     xpath=//div[@data-target-selection-name="sfdc:RecordField.Target_Customer_List__c.Country__c"]//button[@aria-label='Country']
${TCL_COUNTRY_OPTION_XPATH}     xpath=//div[@data-target-selection-name="sfdc:RecordField.Target_Customer_List__c.Country__c"]//lightning-base-combobox-item[@role='option' and @data-value='${COUNTRY_NAME}']

${EDIT_ACTION_CONTACT_TCL_XPATH}  xpath=(//article[@aria-label='Target Customer List']//button[@class='slds-button slds-button_icon-border slds-button_icon-x-small'])[1]
#${EDIT_ACTION_CONTACT_TCL_XPATH}    xpath=//*[@id="tab-2"]/slot/flexipage-component2[5]/slot/lst-dynamic-related-list/article/laf-progressive-container/slot/lst-dynamic-related-list-with-user-prefs/lst-related-list-view-manager/lst-common-list-internal/div/div/lst-primary-display-manager/div/lst-primary-display/lst-primary-display-grid/lightning-datatable/div[2]/div/div/table/tbody/tr/td[7]/lightning-primitive-cell-factory/span/div/lightning-primitive-custom-cell/lst-list-view-row-level-action/lightning-button-menu/button
${DELETE_ACTION_CONTACT_TCL_XPATH}   xpath=//a[@class='slds-button slds-button--icon-x-small slds-button--icon-border-filled' and @title='Show 2 more actions']
${TCL_TABLE_XPATH}      //article[@aria-label="Target Customer List"]//table//tbody//tr

*** Keywords ***
Create Contact TCL
    Sleep    5s
#    Click on Contact Related Tab
#    Execute JavaScript    window.scrollBy(0, 500);
#    Execute JavaScript    window.scrollBy(0, -500);
    Execute JavaScript    document.evaluate("//span[@title='Target Customer List']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView({behavior: "smooth", block: "center"});
    Sleep    2s


    ${tcl_rows}=    Get Element Count    xpath=${TCL_TABLE_XPATH}
    Log To Console    Row elements: ${tcl_rows}
    ${match_found}=    Set Variable    False
    IF    ${tcl_rows} > 0
        FOR    ${index}    IN RANGE    1    ${tcl_rows + 1}

#            ${row_xpath}=    Set Variable    ${TARGET_KPI_TABLE_XPATH}[${index}]
            ${tcl_row_text}=     Get Text    //article[@aria-label="Target Customer List"]//table//tbody//tr[${index}]

            Log To Console    Row: ${tcl_row_text}
            ${tcl_contact_text}=          Get Text    xpath=(//article[@aria-label="Target Customer List"]//table//tbody//tr[${index}]/td[3]//span)[2]
            ${tcl_priority_text}=   Get Text    xpath=//article[@aria-label="Target Customer List"]//table//tbody//tr[${index}]/td[5]
            ${is_contact_match}=    Run Keyword And Return Status    Should Be Equal     ${tcl_contact_text}      ${CONTACT_NAME}
            ${is_priority_match}=    Run Keyword And Return Status    Should Be Equal    ${tcl_priority_text}    ${CONTACT_PRIORITY_OPTION_XPATH}

            ${match_found}=    Evaluate    ${is_contact_match} and ${is_priority_match}
            Exit For Loop If    ${match_found}
        END
    END

    IF    not ${match_found}

        Sleep    10s
        Click Element    ${CONTACT_TCL_NEW_BUTTON}
        Wait Until Page Contains    ${NEW_CONTACT_TCL_PAGE}     10s
        Click Button    ${NEXT_BUTTON_XPATH}
        Sleep    5s
        Input Text     ${SEARCH_CONTACT_DROPDOWN_XPATH}   ${CONTACT_NAME}
        Wait Until Element Is Visible    ${TCL_SEARCH_CONTACT_DROPDOWN_OPTIONS_XPATH}  10s
        Click Element    ${TCL_SEARCH_CONTACT_OPTION_XPATH}
        Sleep    5s
        Input Text     ${SEARCH_USER_DROPDOWN_XPATH}   ${SEARCH_USER_TEXT}
        Wait Until Element Is Visible    ${TCL_SEARCH_USER_DROPDOWN_OPTIONS_XPATH}  10s
        Click Element    ${TCL_SEARCH_USER_OPTION_XPATH}
        Click Button    ${CONTACT_PRIORITY_DROPDOWN_XPATH}
        Click Element   ${CONTACT_PRIORITY_OPTION_XPATH}
        Select Checkbox    ${TCL_ACTIVE_CHECKBOX_XPATH}
        Click Button    ${TCL_APPROVAL_STATUS_DROPDOWN_XPATH}
        Click Element    ${TCL_APPROVAL_STATUS_OPTION_XPATH}
        Select Checkbox    ${TCL_CALCULATE_FREQUENCY_CHECKBOX_XPATH}
#        Input Text     ${TCL_MARKETING_CYCLE_DROPDOWN_XPATH}   ${MC_NAME}
#        Wait Until Element Is Visible  ${TCL_MARKETING_CYCLE_OPTIONS_XPATH}      10s
#        Sleep    5s
#        Click Element    ${TCL_MARKETING_CYCLE_OPTION_XPATH}
        Set Focus To Element     ${TCL_COUNTRY_DROPDOWN_XPATH}
        Click Button    ${TCL_COUNTRY_DROPDOWN_XPATH}
        Click Element   ${TCL_COUNTRY_OPTION_XPATH}
        Sleep    5s
        Click Button    ${SAVE_BUTTON_XPATH}

    ELSE
            Log    Matching Target Customer List already exists. Skipping creation.
    END