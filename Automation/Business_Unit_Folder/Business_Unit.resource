*** Settings ***
Library     SeleniumLibrary
Resource    ../Contact_Folder/Medical_Contact.resource

*** Variables ***
# Create Business Unit XPath
${NEW_BU_PAGE}  New Business Unit
${BU_NAME_XPATH}     xpath=//input[@name='Name']
${BU_NAME}       AE-ENT & Gastro
${START_DATE_XPATH}     xpath=//input[@name='Start_Date__c']
${START_DATE_OPTION}     2025-03-01
${END_DATE_XPATH}     xpath=//input[@name='End_Date__c']
${END_DATE_OPTION}     2025-10-31

# Search Business Unit XPath
${ENTER_BU_TEXT}    Business Unit
${RESULT_BU_TEXT}     xpath=//p[@class='slds-truncate'][contains(.,'Business Unit')]
${BU_PAGE_HEADING}     xpath=//h1[@class='slds-var-p-right_x-small'][contains(.,'Business Unit')]
${FILTER_BU_XPATH}     xpath=//button[contains(@title,'Select a List View: Business Unit')]
${SELECT_ALL_US_BU_XPATH}     xpath=//span[@title='All']
#${SELECT_ALL_US_BU_XPATH}     xpath=//a[contains(.,'US-Business Units')]
#${SEARCH_BU_XPath}  xpath=//a[@title='US Test Business Unit']


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
#    Input Text     ${SEARCH_XPATH}   ${BU_NAME}
#    Press Key    ${SEARCH_XPATH}    \\13
#    Sleep    5s
#    ${SEARCH_BU_XPath}   Set Variable    xpath=//a[@title='${BU_NAME}']
#    ${BU_exists}=    Run Keyword And Return Status    Element Should Be Visible    ${SEARCH_BU_XPath}
#
#
#    Run Keyword If    ${BU_exists}
#    ...    Click Element    ${SEARCH_BU_XPath}
#
#    ...    ELSE
#    ...    Create Business Unit