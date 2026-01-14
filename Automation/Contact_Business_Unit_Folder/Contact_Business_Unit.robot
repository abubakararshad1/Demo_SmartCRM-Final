*** Settings ***
Library     SeleniumLibrary
#Resource    ../Contact_Folder/Medical_Contact.robot
Resource    Contact_Business_Unit.resource
Library    DataDriver   ../Contact_Folder/Medical_Contact_Data.xlsx    sheet_name=Sheet1
Test Template       Click on Contact Related Tab


*** Keywords ***
Click on Contact Related Tab
    [Arguments]    ${FIRST_NAME}	${LAST_NAME}     ${PRIORITY}     ${SPECIALTY}
#    Search and Create Medical Contact

    Sleep    10s
    Click Button    ${APP_LAUNCHER_BUTTON}
    Wait Until Element Is Visible    ${SEARCH_APP}    10s
    Input Text   ${SEARCH_APP}    ${ENTER_CONTACT_TEXT}
    Sleep    10s
    Wait Until Element Is Visible    ${RESULT_CONTACT_TEXT}    10s
    Click Element    ${RESULT_CONTACT_TEXT}
    Wait Until Element Is Visible   ${CONTACT_PAGE_HEADING}     10s
    Sleep    5s
    Click Element   ${FILTER_CONTACT_XPATH}
    Wait Until Element Is Visible   ${SELECT_ALL_AE_CONTACT_XPATH}     10s
    Click Element    ${SELECT_ALL_AE_CONTACT_XPATH}
    Sleep    5s
    Input Text     ${SEARCH_XPATH}   ${FIRST_NAME} ${LAST_NAME}
    Press Key    ${SEARCH_XPATH}    \\13
    Sleep    5s
    ${SEARCH_CONTACT}   Set Variable    xpath=//a[@title='${FIRST_NAME} ${LAST_NAME}']
    Click Element    ${SEARCH_CONTACT}
    Sleep    10s
    ${CONTACT_RELATED_TAB_XPATH}=    Set Variable    xpath=//lightning-formatted-name[contains(text(),"${FIRST_NAME}")]//following::a[@id='flexipage_tab__item' and @data-label='Related']
    Wait Until Element Is Visible    ${CONTACT_RELATED_TAB_XPATH}    10s
    Click Element    ${CONTACT_RELATED_TAB_XPATH}
    Create Contact Business Unit    ${FIRST_NAME}	${LAST_NAME}     ${PRIORITY}     ${SPECIALTY}

Create Contact Business Unit
    [Arguments]     ${FIRST_NAME}	${LAST_NAME}     ${PRIORITY}     ${SPECIALTY}
    Sleep    10s
    FOR    ${index}    IN RANGE    10
        Log To Console   Index is: ${index}
        ${visible}=    Run Keyword And Return Status    Element Should Be Visible   xpath=//lightning-formatted-name[contains(text(),"${FIRST_NAME}")]//following::li[@data-target-selection-name="sfdc:StandardButton.Contact_Business_Unit__c.New"]//button[contains(.,'New')]
        Exit For Loop If    ${visible}
        Execute JavaScript    window.scrollBy(0, 400);
        Sleep    5s
    END
    ${contact_bu_rows}=    Get Element Count    xpath=//lightning-formatted-name[contains(text(),"${FIRST_NAME}")]//following::article[@aria-label="Contact Business Unit"]//table//tbody//tr
    Log To Console    Row elements: ${contact_bu_rows}
    ${match_found}=    Set Variable    False
    IF    ${contact_bu_rows} > 0
        FOR    ${index}    IN RANGE    1    ${contact_bu_rows + 1}
#            ${contact_bu_row_index_xpath}=    Set Variable    xpath=//article[@aria-label="Contact Business Unit"]//table//tbody//tr[${index}]
            ${row_text}=    Get Text    xpath=//lightning-formatted-name[contains(text(),"${FIRST_NAME}")]//following::article[@aria-label="Contact Business Unit"]//table//tbody//tr[${index}]
            Log To Console    Row: ${row_text}
            ${specialty_text}=          Get Text    xpath=//lightning-formatted-name[contains(text(),"${FIRST_NAME}")]//following::article[@aria-label="Contact Business Unit"]//table//tbody//tr[${index}]/td[3]
            ${priority_text}=   Get Text    xpath=//lightning-formatted-name[contains(text(),"${FIRST_NAME}")]//following::article[@aria-label="Contact Business Unit"]//table//tbody//tr[${index}]/td[4]
            ${country_text}=    Get Text    xpath=//lightning-formatted-name[contains(text(),"${FIRST_NAME}")]//following::article[@aria-label="Contact Business Unit"]//table//tbody//tr[${index}]/td[5]
            ${is_specialty_match}=    Run Keyword And Return Status    Should Be Equal     ${specialty_text}      ${SPECIALTY}
            ${is_priority_match}=    Run Keyword And Return Status    Should Be Equal    ${priority_text}    ${PRIORITY}
            ${is_country_match}=     Run Keyword And Return Status    Should Be Equal    ${country_text}    ${COUNTRY_NAME}

            ${match_found}=    Evaluate    ${is_specialty_match} and ${is_priority_match} and ${is_country_match}
            Exit For Loop If    ${match_found}
        END
    END
    IF    not ${match_found}
            Sleep    5s
             ${CONTACT_BUSINESS_UNIT_NEW_BUTTON}=       set variable    //lightning-formatted-name[contains(text(),"${FIRST_NAME}")]//following::li[@data-target-selection-name="sfdc:StandardButton.Contact_Business_Unit__c.New"]//button[contains(.,'New')]
            Wait Until Element Is Visible    ${CONTACT_BUSINESS_UNIT_NEW_BUTTON}    10s
            Click Element    ${CONTACT_BUSINESS_UNIT_NEW_BUTTON}
            Wait Until Page Contains    ${NEW_CONTACT_BUSINESS_UNIT_PAGE}   10s
            Click Button    ${CONTACT_BUSINESS_UNIT_COUNTRY_DROWNDOWN_XPATH}
            Click Element   ${CONTACT_BUSINESS_UNIT_COUNTRY_OPTION_XPATH}
            Click Button    ${CONTACT_SPECIALTY_DROPDOWN_XPATH}
            ${CONTACT_BU_SPECIALTY_OPTION_XPATH}=   set variable    xpath=//lightning-base-combobox-item[@role='option' and @data-value='${SPECIALTY}']
            ${CONTACT_BU_PRIORITY_OPTION_XPATH}=    Set Variable    xpath=//lightning-base-combobox-item[@role='option' and @data-value='${PRIORITY}']

            Click Element   ${CONTACT_BU_SPECIALTY_OPTION_XPATH}
            Click Button    ${CONTACT_PRIORITY_DROPDOWN_XPATH}
            Click Element   ${CONTACT_BU_PRIORITY_OPTION_XPATH}
            Input Text   ${SEARCH_CONTACT_BUSINESS_UNIT_DROWNDOWN_XPATH}     ${BU_NAME}
            Sleep    5s
            Wait Until Element Is Visible   ${SEARCH_CONTACT_BUSINESS_UNIT_DROWNDOWN_OPTIONS_XPATH}  10s
            Click Element   ${SEARCH_CONTACT_BUSINESS_UNIT_OPTION_XPATH}
            Click Button    ${SAVE_BUTTON_XPATH}
    ELSE
            Log    Matching Contact Business Unit already exists. Skipping creation.
    END

*** Test Cases ***
Create Contact Business Unit Test Case
<<<<<<< HEAD
    [Documentation]    Test has only tag 'requirement: 42'.
=======
    [Documentation]    Verify that user Can Search and Create a New Contact Business Unit, If It Does Not Exist - Test has only tag 'requirement: 42'.
    [Tags]    Smoke     Regression
>>>>>>> master
    Click on Contact Related Tab