*** Settings ***
Library     SeleniumLibrary
Resource    Login.resource
Suite Setup     Open My Browser
Library    DataDriver   Login_Data.xlsx    sheet_name=Sheet1
Library    Dialogs
Test Template   Login Scenario

*** Keywords ***
Login Scenario
    [Arguments]     ${username}     ${password}
    Sleep    2s
    Input Text    ${USERNAME_XPATH}    ${username}
    Input Password    ${PASSWORD_XPATH}    ${password}
    Select Checkbox    ${CHECKBOX_XPATH}
    Click Button    ${LOGIN_BUTTON_XPATH}
#    Sleep    5s
    IF    '${username}' == 'qasmart.zee@bssuniversal.com' and '${password}' == 'Bss@2025-1'
        Pause Execution     🟡 Salesforce sent a verification code to Outlook. Please \nenter it manually and click "Verify" in the browser. Then \npress OK to continue.

        # Continue only after you confirm (after entering OTP)

        Wait Until Element Is Visible    ${CRM_TEXT_VISIBLE}     10s
    ELSE
        Page Should Contain    Please check your username and password. If you still can't log in, contact your Salesforce administrator.
    END



*** Test Cases ***
Login Test Case Using ${Status} username and password -- ${username} and ${password}
    [Documentation]    Verify the Login Functionality with ${Status} username and password.
    [Tags]    smoke    critical    login
    Login Scenario