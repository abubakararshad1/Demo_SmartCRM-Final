*** Settings ***
Library     SeleniumLibrary
Resource    Hospital_Account.resource
Library    DataDriver   Hospital_Data.xlsx    sheet_name=Sheet1
Test Template   Search and Create Hospital Account

*** Keywords ***
Create Hospital
    [Arguments]     ${ACCOUNT_NAME}     ${BRICK_NAME}       ${BILLING_ADDRESS}
     Wait Until Element Is Visible    ${NEW_BUTTON_XPATH}    10s
    Click Element    ${NEW_BUTTON_XPATH}
    Wait Until Page Contains    New Account    10s
    Click Button    ${NEXT_BUTTON_XPATH}
    Wait Until Page Contains    New Account: Clinic/Hospital  15s

    # Fill the Hospital Account details
    Input Text        ${NEW_HOSPITAL_ACCOUNT_NAME_XPATH}    ${ACCOUNT_NAME}
    Click Button    ${STATUS_DROPDOWN_XPATH}
    Click Element    ${STATUS_OPTION_XPATH}
    Click Button    ${ACCOUNT_CHANNEL_DROPDOWN_XPATH}
    Click Element    ${NEW_HOSPITAL_ACCOUNT_CHANNEL_OPTION_XPATH}
    Click Button    ${COUNTRY_DROPDOWN_XPATH}
    Click Element    ${COUNTRY_OPTION_XPATH}
#    Scroll Element Into View    ${ACCOUNT_BRICK_DROPDOWN_XPATH}
    Execute JavaScript    document.evaluate("//label[contains(text(),'Brick')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView()
    Sleep    5s
    Input Text    ${ACCOUNT_BRICK_DROPDOWN_XPATH}   ${BRICK_NAME}
    Wait Until Element Is Visible    ${ACCOUNT_BRICK_DROPDOWN_OPTIONS_XPATH}    10s
    Click Element    ${ACCOUNT_BRICK_OPTION_XPATH}
    Sleep    5s
#    Scroll Element Into View    ${ACCOUNT_BILLING_DROPDOWN_XPATH}
##    Click Element    xpath=//input[normalize-space(@placeholder)='Search Address']
    Execute JavaScript    document.evaluate("//legend[contains(text(),'Billing Address')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView()
    Input Text    ${ACCOUNT_BILLING_DROPDOWN_XPATH}    ${BILLING_ADDRESS}
    Sleep    5s
    Wait Until Element Is Visible    ${ACCOUNT_BILLING_SEARCH}    10s
    Sleep    5s
    Click Element    ${ACCOUNT_BILLING_SEARCH_RESULT}
    Sleep    10s
    Click Button    ${SAVE_BUTTON_XPATH}

Search and Create Hospital Account
    [Arguments]     ${ACCOUNT_NAME}     ${BRICK_NAME}       ${BILLING_ADDRESS}
    Sleep    10s
    Click Button    ${APP_LAUNCHER_BUTTON}
    Wait Until Element Is Visible    ${SEARCH_APP}    10s
    Input Text   ${SEARCH_APP}    ${ENTER_ACCOUNT_TEXT}
#    Sleep    20s
    Wait Until Element Is Visible    ${RESULT_ACCOUNT_TEXT}   10s
    Click Element    ${RESULT_ACCOUNT_TEXT}
    Wait Until Element Is Visible   ${ACCOUNT_PAGE_HEADING}     10s
    Sleep    5s

    Click Element   ${FILTER_BRICK_XPATH}
    Wait Until Element Is Visible   ${SELECT_ALL_AE_ACCOUNT_XPATH}     10s
    Click Element    ${SELECT_ALL_AE_ACCOUNT_XPATH}
    Sleep    5s
#    Clear Element Text  ${SEARCH_ACCOUNT_XPATH}
    Input Text   ${SEARCH_XPATH}    ${ACCOUNT_NAME}
    Sleep    10s
    Press Key    ${SEARCH_XPATH}    \\13
    ${SEARCH_HOSPITAL_NAME}  Set Variable    xpath=//a[@title='${ACCOUNT_NAME}']
    Log To Console    ${SEARCH_HOSPITAL_NAME}
    Sleep    10s

    ${hospital_exists}=    Run Keyword And Return Status    Element Should Be Visible    ${SEARCH_HOSPITAL_NAME}
    Run Keyword If    ${hospital_exists}
    ...    Click Element    ${SEARCH_HOSPITAL_NAME}

    ...    ELSE
    ...    Create Hospital    ${ACCOUNT_NAME}     ${BRICK_NAME}     ${BILLING_ADDRESS}


*** Test Cases ***
Hospital Account Test Case Using ${ACCOUNT_NAME} and ${BRICK_NAME}
<<<<<<< HEAD
    [Documentation]    Test has only tag 'requirement: 42'.
    [Tags]    smoke
=======
    [Documentation]    Verify user Can Search and Create a New Hospital, If It Does Not Exist - Test has only tag 'requirement: 42'.
    [Tags]    Smoke
>>>>>>> master
    Search and Create Hospital Account

