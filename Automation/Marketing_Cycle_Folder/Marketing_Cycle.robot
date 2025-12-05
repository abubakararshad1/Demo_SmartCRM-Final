*** Settings ***
Library     SeleniumLibrary
Resource    Marketing_Cycle.resource

*** Test Cases ***
Create Marketing Cycle
    [Documentation]    Test has only tag 'requirement: 42'.
    [Tags]    smoke
    Search and Create Marketing Cycle
#    Log To Console    >>> Calling pop up scrolling
#    Pop up Scrolling
#    Execute Javascript      window.scrollTo(0,1000);
#    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);
#    ${value}=    Execute JavaScript    return window.pageYOffset;
#    Log To Console    Number of pixels moved: ${value}
#
#    Sleep    10s
#    Execute JavaScript    window.scrollBy(0, 400);
##    ${flag}=    Set Variable    xpath=//li[@data-target-selection-name="sfdc:StandardButton.MarketingCycleDetail__c.New"]
##    Execute JavaScript    arguments[0].scrollIntoView();    ${flag}
#    ${value}=    Execute JavaScript    return window.pageYOffset;
#    Log To Console    Number of pixels moved: ${value}
#
#    Log To Console    >>> Returned from scrolling
#    Sleep    20s