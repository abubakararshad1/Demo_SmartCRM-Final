*** Settings ***
Library     SeleniumLibrary
Resource    Marketing_Cycle_Detail.resource

*** Test Cases ***
Verify that user Can Search and Create a New marketing cycle detial
    [Documentation]    Verify that user Can Search and Create a New marketing cycle detials.
    [Tags]    Smoke Regression
    Search and Create Marketing Cycle Detail