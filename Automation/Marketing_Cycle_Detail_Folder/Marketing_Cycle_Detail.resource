*** Settings ***
Library     SeleniumLibrary
Resource    ../Marketing_Cycle_Folder/Marketing_Cycle.resource
Resource    ../Contact_Business_Unit_Folder/Contact_Business_Unit.resource
Library     ../Marketing_Cycle_Detail_Folder/scroll_keyword.py


*** Variables ***
# Create Marketing Cycle Detail XPath
${MC_DETAIL_NEW_BUTTON_XPATH}   xpath=//li[@data-target-selection-name='sfdc:StandardButton.MarketingCycleDetail__c.New']//button[contains(text(),'New')]
${NEW_MC_DETAIL_PAGE}  New Marketing Cycle Detail
${SEARCH_MC_DETAIL_BUSINESS_UNIT_DROWNDOWN_XPATH}   xpath=//div[@data-target-selection-name='sfdc:RecordField.MarketingCycleDetail__c.Business_Unit__c']//input[contains(@placeholder,'Business Unit')]
${SEARCH_MC_DETAIL_BUSINESS_UNIT_DROWNDOWN_OPTIONS_XPATH}     xpath=//div[@data-target-selection-name="sfdc:RecordField.MarketingCycleDetail__c.Business_Unit__c"]//lightning-base-combobox-item[@class='slds-media slds-listbox__option slds-media_center slds-listbox__option_entity' and @role='option']
${SEARCH_MC_DETAIL_BUSINESS_UNIT_OPTION_XPATH}      xpath=(//div[@data-target-selection-name="sfdc:RecordField.MarketingCycleDetail__c.Business_Unit__c"]//lightning-base-combobox-item[@class='slds-media slds-listbox__option slds-media_center slds-listbox__option_entity' and @role='option'])[2]
${MC_DETAIL_COUNTRY_DROPDOWN_XPATH}     xpath=//div[@data-target-selection-name='sfdc:RecordField.MarketingCycleDetail__c.Country__c']//button[@aria-label='Country']
${MC_DETAIL_COUNTRY_OPTION_XPATH}     xpath=//div[@data-target-selection-name='sfdc:RecordField.MarketingCycleDetail__c.Country__c']//lightning-base-combobox-item[@role='option' and @data-value='United Arab Emirates']
${MC_DETAIL_CONTACT_BU_PRIORITY_NAME}       B
${MC_DETAIL_CONTACT_BU_PRIORITY_OPTION_XPATH}    xpath=//lightning-base-combobox-item[@role='option' and @data-value='${MC_DETAIL_CONTACT_BU_PRIORITY_NAME}']
${MC_DETAIL_SPECIALTY_NAME}     ENT
${MC_DETAIL_FREQUENCY_DROPDOWN_XPATH}  xpath=//button[@aria-label='Frequency']
${MC_DETAIL_FREQUENCY_OPTION_XPATH}     xpath=//lightning-base-combobox-item[@data-value='2']
${MC_DETAIL_SPECIALTY_OPTION_XPATH}     xpath=//div[@data-value='${MC_DETAIL_SPECIALTY_NAME}']
${MC_DETAIL_MOVE_TO_BUTTON_XPATH}     xpath=//button[@title='Move to Chosen']//lightning-primitive-icon[@variant='bare']
#${MC_DETAIL_TABLE_XPATH}     //article[@aria-label="Marketing Cycle Detail"]//table//tbody//tr

*** Keywords ***
Search and Create Marketing Cycle Detail
    Sleep    5s
#    Execute JavaScript    document.evaluate("//li[@data-target-selection-name='sfdc:StandardButton.MarketingCycleDetail__c.New']//button[text()='New']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView({ behavior: 'smooth', block: 'center' });
    FOR    ${index}    IN RANGE    5
        Log To Console   Index is: ${index}
         ${visible}=    Run Keyword And Return Status    Element Should Be Visible   ${MC_DETAIL_NEW_BUTTON_XPATH}
        Exit For Loop If    ${visible}
        Execute JavaScript    window.scrollBy(0, 500);
        Sleep    3s
    END
    Sleep    3s
    Wait Until Page Contains Element    xpath=//article[@aria-label="Marketing Cycle Detail"]    20s
    ${rows}=    Get Element Count    xpath=//article[@aria-label="Marketing Cycle Detail"]//table//tbody//tr
    Log To Console    Row elements: ${rows}
    ${match_found}=    Set Variable    False
    ${expected_bu}=         Set Variable    ${BU_NAME}
    ${expected_specialty}=  Set Variable    ${MC_DETAIL_SPECIALTY_NAME}
    ${expected_priority}=   Set Variable    ${MC_DETAIL_CONTACT_BU_PRIORITY_NAME}
    IF    ${rows} > 0
        FOR    ${index}    IN RANGE    1    ${rows + 1}
            Log To Console    Rows + 1 : ${rows + 1}
#            ${MC_DETAIL_TABLE_ROW_XPATH}=    Set Variable    //article[@aria-label="Marketing Cycle Detail"]//table//tbody//tr[${index}]
            ${row_text}=     Get Text    //article[@aria-label="Marketing Cycle Detail"]//table//tbody//tr[${index}]
            Log To Console    Row: ${row_text}
            ${bu_xpath}=          Set Variable    xpath=(//article[@aria-label="Marketing Cycle Detail"]//table//tbody//tr[${index}]/td[3]//span)[2]
            ${specialty_xpath}=   Set Variable    xpath=//article[@aria-label="Marketing Cycle Detail"]//table//tbody//tr[${index}]/td[4]
            ${priority_xpath}=    Set Variable    xpath=//article[@aria-label="Marketing Cycle Detail"]//table//tbody//tr[${index}]/td[5]
            ${bu_text}=           Get Text    ${bu_xpath}
            ${specialty_text}=    Get Text    ${specialty_xpath}
            ${priority_text}=     Get Text    ${priority_xpath}
            ${is_bu_match}=    Run Keyword And Return Status    Should Be Equal     ${bu_text}      ${expected_bu}
            ${is_specialty_match}=    Run Keyword And Return Status    Should Be Equal    ${specialty_text}    ${expected_specialty}
            ${is_priority_match}=     Run Keyword And Return Status    Should Be Equal    ${priority_text}    ${expected_priority}

            ${match_found}=    Evaluate   ${is_bu_match} and ${is_specialty_match} and ${is_priority_match}
                Exit For Loop If    ${match_found}
        END
    END

    IF    not ${match_found}
            Create New Marketing Cycle Detail
    ELSE
            Log    Matching Marketing Cycle Detail already exists. Skipping creation.
    END

Create New Marketing Cycle Detail
    Sleep    5s
    Click Element    ${MC_DETAIL_NEW_BUTTON_XPATH}
    Sleep    8s

    Set Focus To Element    ${SEARCH_MC_DETAIL_BUSINESS_UNIT_DROWNDOWN_XPATH}
    Input Text      ${SEARCH_MC_DETAIL_BUSINESS_UNIT_DROWNDOWN_XPATH}   ${BU_NAME}
    Sleep    3s
    Wait Until Element Is Visible   ${SEARCH_MC_DETAIL_BUSINESS_UNIT_DROWNDOWN_OPTIONS_XPATH}   10s
    Click Element   ${SEARCH_MC_DETAIL_BUSINESS_UNIT_OPTION_XPATH}

    Click Button    ${MC_DETAIL_FREQUENCY_DROPDOWN_XPATH}
    Click Element   ${MC_DETAIL_FREQUENCY_OPTION_XPATH}

    Click Button    ${MC_DETAIL_COUNTRY_DROPDOWN_XPATH}
    Click Element   ${MC_DETAIL_COUNTRY_OPTION_XPATH}

    Click Button    ${CONTACT_PRIORITY_DROPDOWN_XPATH}
    Click Element   ${MC_DETAIL_CONTACT_BU_PRIORITY_OPTION_XPATH}

    Sleep    3s
    Execute JavaScript    document.evaluate("//div[contains(text(),'Specialty')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView()
    Sleep    3s
    Set Focus To Element    ${MC_DETAIL_SPECIALTY_OPTION_XPATH}
    Set Focus To Element    ${MC_DETAIL_MOVE_TO_BUTTON_XPATH}
    Click Element    ${MC_DETAIL_MOVE_TO_BUTTON_XPATH}

    Click Element    ${SAVE_BUTTON_XPATH}

