*** Settings ***
Library     SeleniumLibrary
Resource    Target_KPI.resource

*** Test Cases ***
Create Target KPI
<<<<<<< HEAD
    [Documentation]    Test has only tag 'requirement: 42'.
    [Tags]    smoke
=======
    [Documentation]    Verify that user can Search and Create a New Target KPI, If It Does Not Exist.
    [Tags]    Smoke     Regression
>>>>>>> master
    Click on Marketing Cycle Related Tab
    Create Target KPI