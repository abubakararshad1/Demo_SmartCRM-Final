*** Settings ***
Library     SeleniumLibrary
Resource    Target_KPI.resource

*** Test Cases ***
Create Target KPI
    [Documentation]    Verify that user can Search and Create a New Target KPI, If It Does Not Exist.
    [Tags]    Smoke     Regression
    Click on Marketing Cycle Related Tab
    Create Target KPI