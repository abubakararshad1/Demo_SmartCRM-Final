*** Settings ***
Library    SeleniumLibrary

*** Variables ***
# Login Folder XPath
${USERNAME_XPATH}    xpath=//*[@id="username"]
${PASSWORD_XPATH}    xpath=//*[@id="password"]
${LOGIN_BUTTON_XPATH}    xpath=//*[@id="Login"]
${CHECKBOX_XPATH}       xpath=//input[@id="rememberUn"]
#${CRM_TEXT_VISIBLE}     xpath=/html/body/div[4]/div[1]/section/div[1]/div[1]/one-appnav/div/div/div/h1
#${CRM_TEXT_VISIBLE}     xpath=//div[contains(@class,'logo')]//parent::span[@role="navigation"]
#${CRM_TEXT_VISIBLE}     xpath=//div[contains(@class,'slds-no-print oneAppNavContainer')]
${CRM_TEXT_VISIBLE}     xpath=//div[contains(@class,'slds-no-print oneAppNavContainer')]//child::span[@title='CRM']
*** Keywords ***
Open My Browser
    Open Browser    https://raptorsconsulting--qasmartcrm.sandbox.lightning.force.com/      Chrome      options=add_experimental_option("detach", True)
#    Open Browser    https://test.salesforce.com/    Edge
    Maximize Browser Window

