*** Settings ***
Library     SeleniumLibrary
Resource    User_Business_Unit.resource

*** Test Cases ***
User Business Unit Test Case For ${BU_NAME}
<<<<<<< HEAD
    [Documentation]    Test has only tag 'requirement: 42'.
=======
    [Documentation]     Verify that user Can Search and Create User BU, If It Does Not Exist.
>>>>>>> master
    [Tags]    smoke
    Create User Business Unit