*** Settings ***
Library     SeleniumLibrary
Resource    Brick_Account.resource
Library     DataDriver   Brick_Data.xlsx    sheet_name=Sheet1
Test Template   Search and Create Brick Account

*** Keywords ***
Create Brick
    [Arguments]     ${BRICK_NAME}     ${BRICK_DESCRIPTION}
    Wait Until Element Is Visible   ${NEW_BUTTON_XPATH}     10s
    Click Element    ${NEW_BUTTON_XPATH}
    Wait Until Page Contains    New Account    10s
    Click Element   ${BRICK_RADIO_OPTION_XAPTH}
    Click Button    ${NEXT_BUTTON_XPATH}
    Wait Until Page Contains    New Account: Brick  15s

    # Fill the Brick Account detail
    Input Text    ${NEW_BRICK_NAME_XPATH}    ${BRICK_NAME}
#    Set Global Variable    ${BRICK_NAME}    ${NEW_BRICK_NAME}
    Click Button    ${STATUS_DROPDOWN_XPATH}
    Click Element    ${STATUS_OPTION_XPATH}
    Input Text       ${BRICK_DESCRIPTION_XPATH}   ${BRICK_DESCRIPTION}
    Click Button    ${ACCOUNT_CHANNEL_DROPDOWN_XPATH}
    Click Element    ${BRICK_CHANNEL_OPTION_XPATH}
    Set Focus To Element     ${COUNTRY_DROPDOWN_XPATH}
    Click Button    ${COUNTRY_DROPDOWN_XPATH}
    Click Element   ${COUNTRY_OPTION_XPATH}
    Click Button    ${SAVE_BUTTON_XPATH}

Search and Create Brick Account
    [Arguments]     ${BRICK_NAME}     ${BRICK_DESCRIPTION}
    Sleep    10s
    Click Button    ${APP_LAUNCHER_BUTTON}
#    Sleep    10s
    Wait Until Element Is Visible    ${SEARCH_APP}    10s
    Input Text   ${SEARCH_APP}    ${ENTER_ACCOUNT_TEXT}
#    Sleep    20s
    Wait Until Element Is Visible    ${RESULT_ACCOUNT_TEXT}    10s
    Click Element    ${RESULT_ACCOUNT_TEXT}
    Wait Until Element Is Visible   ${ACCOUNT_PAGE_HEADING}     10s
    Sleep    5s
    Click Element   ${FILTER_BRICK_XPATH}
    Wait Until Element Is Visible   ${SELECT_ALL_AE_BRICK_XPATH}     10s
    Click Element    ${SELECT_ALL_AE_BRICK_XPATH}
    Sleep    5s

    Clear Element Text    ${SEARCH_XPATH}
    Sleep    10s
    Input Text     ${SEARCH_XPATH}   ${BRICK_NAME}
    Sleep    10s
    Press Key    ${SEARCH_XPATH}   \\13
    Sleep    10s
    ${SEARCH_BRICK_NAME_XPath}   Set Variable    xpath=//a[@title='${BRICK_NAME}']
    ${brick_exists}=    Run Keyword And Return Status    Element Should Be Visible    ${SEARCH_BRICK_NAME_XPath}
#

    Run Keyword If    ${brick_exists}
    ...    Click Element    ${SEARCH_BRICK_NAME_XPath}

    ...    ELSE
    ...    Create Brick    ${BRICK_NAME}    ${BRICK_DESCRIPTION}

*** Test Cases ***
Brick Test Case Using ${BRICK_NAME}
    [Documentation]    Verify System Can Search and Create a New Brick.
    [Tags]    Smoke
    Search and Create Brick Account
