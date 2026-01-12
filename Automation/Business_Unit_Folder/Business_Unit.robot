*** Settings ***
Library     SeleniumLibrary
Resource    Business_Unit.resource
#Library    DataDriver   BU_Data.xlsx    sheet_name=Sheet1
#Test Template   Search and Create Business Unit


*** Keywords ***
Create Business Unit
#    [Arguments]     ${Business_Unit_Name}
    Wait Until Element Is Visible   ${NEW_BUTTON_XPATH}     10s
    Click Element    ${NEW_BUTTON_XPATH}
    Wait Until Page Contains    ${NEW_BU_PAGE}    10s
#    Input Text   ${BU_NAME_XPATH}    ${Business_Unit_Name}
    Input Text   ${BU_NAME_XPATH}    ${BU_Name}
    Click Button    ${COUNTRY_DROPDOWN_XPATH}
    Click Element   ${COUNTRY_OPTION_XPATH}
#    Click Button    xpath=//button[contains(@title,'Select a date for Start Date')]
    Input Text    ${START_DATE_XPATH}    ${START_DATE_OPTION}
    Input Text    ${END_DATE_XPATH}      ${END_DATE_OPTION}
    Click Button    ${SAVE_BUTTON_XPATH}


Search and Create Business Unit
    Sleep    10s
    Click Button    ${APP_LAUNCHER_BUTTON}
    Wait Until Element Is Visible    ${SEARCH_APP}    10s
    Input Text   ${SEARCH_APP}    ${ENTER_BU_TEXT}
#    Sleep    10s
    Wait Until Element Is Visible    ${RESULT_BU_TEXT}    10s
    Click Element    ${RESULT_BU_TEXT}
#    Sleep    5s
#    Click Element   //span[text()='Contacts']
#    Sleep    3s
#    Click Element    //span[text()='Business Unit']
    Reload Page
    Wait Until Element Is Visible   ${BU_PAGE_HEADING}     10s
    Sleep    5s
    Click Element   ${FILTER_BU_XPATH}
    Wait Until Element Is Visible   ${SELECT_ALL_US_BU_XPATH}     10s
    Click Element    ${SELECT_ALL_US_BU_XPATH}
    Sleep    10s
    Wait Until Element Is Enabled    ${SEARCH_XPATH}        10s
    Input Text     ${SEARCH_XPATH}   ${BU_NAME}
    Press Key    ${SEARCH_XPATH}    \\13
    Sleep    5s
    ${SEARCH_BU_XPath}=   Set Variable    xpath=//a[@title='${BU_NAME}']
    ${BU_exists}=    Run Keyword And Return Status    Element Should Be Visible    ${SEARCH_BU_XPath}
    Sleep    5s

    Run Keyword If    ${BU_exists}
    ...    Click Element    ${SEARCH_BU_XPath}

    ...    ELSE
    ...    Create Business Unit

#*** Keywords ***
#Create Business Unit
##    [Arguments]     ${Business_Unit_Name}
#    Wait Until Element Is Visible   ${NEW_BUTTON_XPATH}     10s
#    Click Element    ${NEW_BUTTON_XPATH}
#    Wait Until Page Contains    ${NEW_BU_PAGE}    10s
##    Input Text   ${BU_NAME_XPATH}    ${Business_Unit_Name}
#    Input Text   ${BU_NAME_XPATH}    ${BU_Name}
#    Click Button    ${COUNTRY_DROPDOWN_XPATH}
#    Click Element   ${COUNTRY_OPTION_XPATH}
##    Click Button    xpath=//button[contains(@title,'Select a date for Start Date')]
#    Input Text    ${START_DATE_XPATH}    ${START_DATE_OPTION}
#    Input Text    ${END_DATE_XPATH}      ${END_DATE_OPTION}
#    Click Button    ${SAVE_BUTTON_XPATH}
#
#
#Search and Create Business Unit
#    [Arguments]     ${Business_Unit_Name}
#    Sleep    10s
#    Click Button    ${APP_LAUNCHER_BUTTON}
#    Wait Until Element Is Visible    ${SEARCH_APP}    10s
#    Input Text   ${SEARCH_APP}    ${ENTER_BU_TEXT}
##    Sleep    10s
#    Wait Until Element Is Visible    ${RESULT_BU_TEXT}    10s
#    Click Element    ${RESULT_BU_TEXT}
#    Wait Until Element Is Visible   ${BU_PAGE_HEADING}     10s
#    Sleep    5s
#    Click Element   ${FILTER_BU_XPATH}
#    Wait Until Element Is Visible   ${SELECT_ALL_US_BU_XPATH}     10s
#    Click Element    ${SELECT_ALL_US_BU_XPATH}
#    Sleep    10s
#    Input Text     ${SEARCH_XPATH}   ${Business_Unit_Name}
#    Press Key    ${SEARCH_XPATH}    \\13
#    Sleep    5s
#    ${SEARCH_BU_XPath}   Set Variable    xpath=//a[@title='${Business_Unit_Name}']
#    ${BU_exists}=    Run Keyword And Return Status    Element Should Be Visible    ${SEARCH_BU_XPath}
#
#
#    Run Keyword If    ${BU_exists}
#    ...    Click Element    ${SEARCH_BU_XPath}
#
#    ...    ELSE
#    ...    Create Business Unit     ${Business_Unit_Name}

*** Test Cases ***
#Business Unit Test Case Using ${BU_NAME}
Create Business Unit Using ${BU_NAME}
    [Documentation]    Test has only tag 'requirement: 42'.
    [Tags]    smoke
    Search and Create Business Unit