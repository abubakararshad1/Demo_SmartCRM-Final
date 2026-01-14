*** Settings ***
Library     SeleniumLibrary
#Resource    ../Contact_Folder/Medical_Contact.robot
Resource    Contact_Business_Unit.resource
#Library    DataDriver   ../Contact_Folder/Medical_Contact_Data.xlsx    sheet_name=Sheet1
#Test Template       Click on Contact Related Tab


*** Keywords ***
#Create Medical Contact
#    [Arguments]    ${CONTACT_SALUTATION}    ${FIRST_NAME}	${LAST_NAME}	${CONTACT_EXTERNAL_ID}      ${ACCOUNT_NAME}     ${PRIORITY}     ${SPECIALTY}    ${PERSON_TYPE}      ${GENDER}    ${EMAIL}	${MOBILE}	${PHONE}	${MAILNG_ADDRESS}
#    Wait Until Element Is Visible   ${NEW_BUTTON_XPATH}     10s
#    Click Element    ${NEW_BUTTON_XPATH}
#    Wait Until Page Contains    ${NEW_MEDICAL_CONTACT_PAGE}    10s
#    Click Element   ${MEDICAL_RADIO_OPTION_XPATH}
#    Click Button    ${NEXT_BUTTON_XPATH}
#    Sleep    10s
#    Wait Until Page Contains    ${MEDICAL_CONTACT_PAGE}  10s
#
#    # Fill the Medical Contact detail
#    Click Element    ${SALUTATION_MEDICAL_DROPDOWN}
#    ${SALUTATION_MEDICAL_OPTION}    Set Variable    xpath=//span[@class='slds-media__body'][contains(.,'${CONTACT_SALUTATION}')]
#    Wait Until Element Is Visible    ${SALUTATION_MEDICAL_OPTION}   10s
#    Click Element    ${SALUTATION_MEDICAL_OPTION}
#    Input Text    ${NEW_MEDICAL_FIRST_NAME_XPATH}    ${FIRST_NAME}
#    Input Text    ${NEW_MEDICAL_LAST_NAME_XPATH}    ${LAST_NAME}
#    Input Text    ${NEW_MEDICAL_EXTERNAL_ID_XPATH}    ${CONTACT_EXTERNAL_ID}
##    Set Global Variable    ${BRICK_NAME}    ${NEW_BRICK_NAME}
#    Click Button    ${STATUS_DROPDOWN_XPATH}
#    Click Element   ${STATUS_OPTION_XPATH}
#    Click Button    ${CONTACT_PRIORITY_DROPDOWN_XPATH}
#    ${CONTACT_PRIORITY_OPTION_XPATH}    Set Variable    xpath=//lightning-base-combobox-item[@role='option' and @data-value='${PRIORITY}']
#    Click Element   ${CONTACT_PRIORITY_OPTION_XPATH}
#    Click Button    ${CONTACT_SPECIALTY_DROPDOWN_XPATH}
#    ${CONTACT_SPECIALTY_OPTION_XPATH}     Set Variable    xpath=//lightning-base-combobox-item[@role='option' and @data-value='${SPECIALTY}']
#    Click Element   ${CONTACT_SPECIALTY_OPTION_XPATH}
#    Mouse Down    ${NEW_MEDICAL_EMAIL_XPATH}
##    Scroll Element Into View    ${NEW_MEDICAL_EMAIL_XPATH}
#    Click Element    ${NEW_MEDICAL_PERSON_TYPE_DROPDOWN_XPATH}
#    ${NEW_MEDICAL_PERSON_TYPE_OPTION_XPATH}     Set Variable    xpath=//lightning-base-combobox-item[@role='option' and @data-value='${PERSON_TYPE}']
#    Click Element   ${NEW_MEDICAL_PERSON_TYPE_OPTION_XPATH}
#    Click Button    ${COUNTRY_DROPDOWN_XPATH}
#    Click Element   ${COUNTRY_OPTION_XPATH}
#    Input Text    ${NEW_MEDICAL_ACCOUNT_DROPDOWN_XPATH}   ${ACCOUNT_NAME}
#    Wait Until Element Is Visible    ${NEW_MEDICAL_ACCOUNT_DROPDOWN_OPTIONS_XPATH}    10s
#    Click Element    ${NEW_MEDICAL_ACCOUNT_OPTION_XPATH}
#    Click Button    ${NEW_MEDICAL_GENDER_DROPDOWN_XPATH}
#    ${NEW_MEDICAL_GENDER_OPTION_XPATH}     Set Variable    xpath=//lightning-base-combobox-item[@data-value='${GENDER}']
#    Click Element   ${NEW_MEDICAL_GENDER_OPTION_XPATH}
#    Input Text    ${NEW_MEDICAL_EMAIL_XPATH}     ${EMAIL}
#    Input Text    ${NEW_MEDICAL_MOBILE_PHONE_XPATH}    ${MOBILE}
#    Input Text    ${NEW_MEDICAL_PHONE_XPATH}    ${PHONE}
#    Select Checkbox    ${NEW_MEDICAL_EMAIL_OPTIN_XPATH}
##    Checkbox Should Be Selected    ${NEW_MEDICAL_EMAIL_OPTIN_XPATH}
##    Scroll Element Into View    ${NEW_MEDICAL_SHIPPING_ADDRESS_DROPDOWN_XPATH}
##    Mouse Down     ${NEW_MEDICAL_SHIPPING_ADDRESS_DROPDOWN_XPATH}
##    Input Text    ${NEW_MEDICAL_SHIPPING_ADDRESS_DROPDOWN_XPATH}    ${MAILNG_ADDRESS}
##    Sleep    10s
##    Wait Until Element Is Visible    ${NEW_MEDICAL_SHIPPING_ADDRESS_SEARCH_RESULT}    10s
##    Click Element    ${NEW_MEDICAL_SHIPPING_ADDRESS_SEARCH_RESULT}
#    Sleep    10s
#    Click Button    ${SAVE_BUTTON_XPATH}

#Click on Contact Related Tab
#    [Arguments]    ${CONTACT_SALUTATION}    ${FIRST_NAME}	${LAST_NAME}	${CONTACT_EXTERNAL_ID}      ${ACCOUNT_NAME}     ${PRIORITY}     ${SPECIALTY}    ${PERSON_TYPE}      ${GENDER}    ${EMAIL}	${MOBILE}	${PHONE}	${MAILNG_ADDRESS}
#    Sleep    10s
##    Search and Create Medical Contact
#
#    Click Button    ${APP_LAUNCHER_BUTTON}
#    Wait Until Element Is Visible    ${SEARCH_APP}    10s
#    Input Text   ${SEARCH_APP}    ${ENTER_CONTACT_TEXT}
#    Sleep    10s
#    Wait Until Element Is Visible    ${RESULT_CONTACT_TEXT}    10s
#    Click Element    ${RESULT_CONTACT_TEXT}
#    Wait Until Element Is Visible   ${CONTACT_PAGE_HEADING}     10s
#    Sleep    5s
#    Click Element   ${FILTER_CONTACT_XPATH}
#    Wait Until Element Is Visible   ${SELECT_ALL_US_CONTACT_XPATH}     10s
#    Click Element    ${SELECT_ALL_US_CONTACT_XPATH}
#    Sleep    5s
#    Input Text     ${SEARCH_XPATH}   ${FIRST_NAME} ${LAST_NAME}
#    Press Key    ${SEARCH_XPATH}    \\13
#    Sleep    5s
#    ${SEARCH_CONTACT}   Set Variable    xpath=//a[@title='${FIRST_NAME} ${LAST_NAME}']
#    ${contact_exists}=    Run Keyword And Return Status    Element Should Be Visible    ${SEARCH_CONTACT}
#
#
#    Run Keyword If    ${contact_exists}
#    ...    Click Element    ${SEARCH_CONTACT}
#
#    ...    ELSE
#    ...    Create Medical Contact   ${CONTACT_SALUTATION}    ${FIRST_NAME}	${LAST_NAME}	${CONTACT_EXTERNAL_ID}      ${ACCOUNT_NAME}     ${PRIORITY}     ${SPECIALTY}    ${PERSON_TYPE}      ${GENDER}    ${EMAIL}	${MOBILE}	${PHONE}	${MAILNG_ADDRESS}
#
#
#
#    Sleep    10s
#    Wait Until Element Is Visible    ${CONTACT_RELATED_TAB}    10s
#    Click Element    ${CONTACT_RELATED_TAB}
#    Create Contact Business Unit

*** Test Cases ***
Create Contact Business Unit Test Case
    [Documentation]    Test has only tag 'requirement: 42'.
    Click on Contact Related Tab
<<<<<<< HEAD
    Create Contact Business Unit
=======
    Create Contact Business Unit
>>>>>>> master
