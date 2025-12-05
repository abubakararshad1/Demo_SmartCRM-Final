*** Settings ***
Library     SeleniumLibrary
Resource    Target_KPI.resource

*** Test Cases ***
Create Target KPI
    [Documentation]    Test has only tag 'requirement: 42'.
    [Tags]    smoke
    Click on Marketing Cycle Related Tab
    Create Target KPI