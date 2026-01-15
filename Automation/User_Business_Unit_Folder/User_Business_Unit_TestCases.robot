*** Settings ***
Library     SeleniumLibrary
Resource    User_Business_Unit.resource

*** Test Cases ***
Verify that user Can Search and Create User Business Unit ( ${BU_NAME} )
    [Documentation]     Verify that user Can Search and Create User BU, If It Does Not Exist.
    [Tags]    smoke
    Create User Business Unit