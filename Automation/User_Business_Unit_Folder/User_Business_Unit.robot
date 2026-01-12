*** Settings ***
Library     SeleniumLibrary
Resource    User_Business_Unit.resource

*** Test Cases ***
User Business Unit Test Case For ${BU_NAME}
    [Documentation]     Verify that user Can Search and Create User BU, If It Does Not Exist.
    [Tags]    smoke
    Create User Business Unit