*** Settings ***
Library     SeleniumLibrary
Resource    Marketing_Cycle_Detail.resource

*** Test Cases ***
Create Marketing Cycle Detail
    [Documentation]    Verify that user Can Search and Create a New marketing cycle detials.
    [Tags]    Smoke Regression
    Search and Create Marketing Cycle Detail