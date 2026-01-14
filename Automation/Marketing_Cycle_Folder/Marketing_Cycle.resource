*** Settings ***
Library     SeleniumLibrary
Resource    ../Business_Unit_Folder/Business_Unit.resource

*** Variables ***
# Create Marketing Cycle XPath
${NEW_MC_PAGE}  New Marketing Cycle
${MC_NAME_XPATH}     xpath=//input[@name='Name']
${MC_NAME}       MC-AE-10-2025
${MC_START_DATE_XPATH}     xpath=//div[@data-target-selection-name='sfdc:RecordField.Marketing_Cycle__c.Start_Date__c']//input[@name='Start_Date__c']
${START_DATE_OPTION}     2025-10-01
${MC_END_DATE_XPATH}     xpath=//div[@data-target-selection-name="sfdc:RecordField.Marketing_Cycle__c.End_Date__c"]//input[@name='End_Date__c']
${END_DATE_OPTION}     2025-10-31
${MC_COUNTRY_DROPDOWN_XPATH}     xpath=//div[@data-target-selection-name="sfdc:RecordField.Marketing_Cycle__c.Country__c"]//button[@aria-label='Country']
${MC_COUNTRY_OPTION_XPATH}     xpath=//div[@data-target-selection-name="sfdc:RecordField.Marketing_Cycle__c.Country__c"]//lightning-base-combobox-item[@role='option' and @data-value='${COUNTRY_NAME}']

# Search Marketing Cycle XPath
${ENTER_MC_TEXT}    Marketing Cycle
${RESULT_MC_TEXT}     xpath=//p[@class='slds-truncate'][contains(.,'Marketing Cycle')]
${MC_PAGE_HEADING}     xpath=//h1[@class='slds-var-p-right_x-small'][contains(.,'Marketing Cycle')]
${FILTER_MC_XPATH}     xpath=//button[contains(@title,'Select a List View: Marketing Cycle')]
#${SELECT_ALL_US_MC_XPATH}     xpath=//span[@title='US - Marketing Cycle']
${SELECT_ALL_US_MC_XPATH}     xpath=//span[@title='All']
#${SELECT_ALL_US_MC_XPATH}     xpath=//a[contains(.,'US - Marketing Cycle')]
${SEARCH_MC_XPath}      xpath=//a[@title='${MC_NAME}']

## Edit Marketing Cycle XPath
#${EDIT_MC_BUTTON_XPATH}     xpath=//li[@data-target-selection-name='sfdc:StandardButton.Marketing_Cycle__c.Edit']//button[@name='Edit']
#${EDIT_MC_START_DATE_OPTION}     2025-06-30
#
## Delete Marketing Cycle XPath
#${DELETE_MC_ACTION_BUTTON_XPATH}    xpath=//button[@class='slds-button slds-button_icon-border-filled fix-slds-button_icon-border-filled slds-button_last']
#${DELETE_MC_BUTTON_XPATH}     xpath=//a[contains(.,'Delete')]
<<<<<<< HEAD


*** Keywords ***
Create Marketing Cycle
=======
*** Keywords ***
Create Marketing Cycle

>>>>>>> master
    Wait Until Element Is Visible   ${NEW_BUTTON_XPATH}     10s
    Click Element    ${NEW_BUTTON_XPATH}
    Wait Until Page Contains    ${NEW_MC_PAGE}    10s
    Input Text   ${MC_NAME_XPATH}    ${MC_NAME}
    Input Text    ${MC_START_DATE_XPATH}    ${START_DATE_OPTION}
    Input Text    ${MC_END_DATE_XPATH}       ${END_DATE_OPTION}
    Click Button    ${MC_COUNTRY_DROPDOWN_XPATH}
    Click Element   ${MC_COUNTRY_OPTION_XPATH}
#    Click Button    xpath=//button[contains(@title,'Select a date for Start Date')]
    Click Button    ${SAVE_BUTTON_XPATH}
<<<<<<< HEAD


=======
>>>>>>> master
Search and Create Marketing Cycle
    Sleep    10s
    Click Button    ${APP_LAUNCHER_BUTTON}
    Wait Until Element Is Visible    ${SEARCH_APP}    10s
    Input Text   ${SEARCH_APP}    ${ENTER_MC_TEXT}
#    Sleep    10s
    Wait Until Element Is Visible    ${RESULT_MC_TEXT}    10s
    Click Element    ${RESULT_MC_TEXT}
    Wait Until Element Is Visible   ${MC_PAGE_HEADING}     10s
    Sleep    5s
    Click Element   ${FILTER_MC_XPATH}
    Wait Until Element Is Visible   ${SELECT_ALL_US_MC_XPATH}     10s
    Click Element    ${SELECT_ALL_US_MC_XPATH}
    Sleep    10s
    Input Text     ${SEARCH_XPATH}   ${MC_NAME}
    Press Key    ${SEARCH_XPATH}    \\13
    Sleep    5s
    ${MC_exists}=    Run Keyword And Return Status    Element Should Be Visible    ${SEARCH_MC_XPath}

<<<<<<< HEAD

=======
>>>>>>> master
    Run Keyword If    ${MC_exists}
    ...    Click Element    ${SEARCH_MC_XPath}

    ...    ELSE
    ...    Create Marketing Cycle