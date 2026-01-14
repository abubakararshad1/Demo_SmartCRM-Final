*** Settings ***
Library     SeleniumLibrary
Resource    TCL.resource

*** Test Cases ***
Create Target KPI
    [Documentation]    Test has only tag 'requirement: 42'.
    [Tags]    smoke
    Create Contact TCL