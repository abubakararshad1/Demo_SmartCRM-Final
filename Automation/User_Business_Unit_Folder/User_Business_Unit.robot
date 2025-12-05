*** Settings ***
Library     SeleniumLibrary
Resource    User_Business_Unit.resource

*** Test Cases ***
User Business Unit Test Case For ${BU_NAME}
    [Documentation]    Test has only tag 'requirement: 42'.
    [Tags]    smoke
    Create User Business Unit