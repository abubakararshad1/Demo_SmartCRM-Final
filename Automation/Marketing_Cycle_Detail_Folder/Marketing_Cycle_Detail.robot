*** Settings ***
Library     SeleniumLibrary
Resource    Marketing_Cycle_Detail.resource

*** Test Cases ***
Create Marketing Cycle Detail
<<<<<<< HEAD
    [Documentation]    Test has only tag 'requirement: 42'.
    [Tags]    smoke
=======
    [Documentation]    Verify that user Can Search and Create a New marketing cycle detials.
    [Tags]    Smoke Regression
>>>>>>> master
    Search and Create Marketing Cycle Detail