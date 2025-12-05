*** Settings ***
Library     SeleniumLibrary
Resource    Marketing_Cycle_Detail.resource

*** Test Cases ***
Create Marketing Cycle Detail
    [Documentation]    Test has only tag 'requirement: 42'.
    [Tags]    smoke
    Search and Create Marketing Cycle Detail