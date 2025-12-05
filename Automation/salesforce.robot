#*** Settings ***
#Library     SeleniumLibrary
##Resource    Login Folder/Login.resource
##Resource    Account Folder/Brick Account.resource
##Resource    Account Folder/Hospital Account.resource
##Resource    Contact Folder/Medical Contact.resource
#Resource    Contact Folder/Contact Business Unit.resource
#Resource    Contact Folder/TCL.resource
#Resource    Business_Unit_Folder/Business_Unit.resource
#Resource    Business Unit Folder/User Business Unit.resource
#Resource    Marketing Cycle Folder/Marketing Cycle.resource
#Resource    Marketing Cycle Folder/Marketing Cycle Detail.resource
#Resource    Marketing Cycle Folder/Target KPI.resource
##Suite Setup    Open Different Browser
##Suite Teardown    Close Browser
#
#*** Keywords ***
#Open Different Browser
#    Open Browser    https://raptorsconsulting--qasmartcrm.sandbox.lightning.force.com/  Chrome
#    Maximize Browser Window
#
##
##    Open Browser    https://raptorsconsulting--qasmartcrm.sandbox.lightning.force.com/    Edge
##    Maximize Browser Window
#
##    Open Browser    https://raptorsconsulting--qasmartcrm.sandbox.lightning.force.com/    Firefox
##    Maximize Browser Window
#
#
#*** Test Cases ***
##Testcase_1: Verify Login Functionality With Invalid Credentials
##    InValid Login
##
##
##Testcase_1: Verify Login Functionality With Valid Credentials
##    Valid Login
##
##
##
##Testcase_2: Search and Create Brick Account
##    Search and Create Brick Account
##
##Testcase_3: Edit Brick Functionality
##    Edit Brick Account
##
###Testcase_4: Delete Brick
###    Delete Brick Account
###
##Testcase_5: Search and Create Hospital Account
##    Search and Create Hospital Account
##
##Testcase_6: Edit Hospital Account
##       Edit Hospital Account
##
###Testcase_7: Delete Hospital Account
###   Delete Hospital Account
##
##Testcase_8: Search and Create Medical Contact
##    Search and Create Medical Contact
##
##Testcase_9: Edit Medical Contact
##    Edit Medical Contact
##
###Testcase_10: Delete Medical Contact
###    Delete Medical Contact
#
#Testcase_11: Search and Create Business Unit
#    Search and Create Business Unit
#
#Testcase_12: Edit Business Unit
#    Edit Business Unit
#
##Testcase_13: Delete Business Unit
##    Delete Business Unit
#
#Testcase_14: Create User Business Unit
#    Create User Business Unit
#
##Testcase_15: Edit User Business Unit
##    Edit User Business Unit
##
##Testcase_16: Delete User Business Unit
##    Delete User Business Unit
#
#Testcase_17: Click on Contact Related Tab
#    Click on Contact Related Tab
#
#Testcase_18: Create Contact Business Unit
#    Create Contact Business Unit
#
#Testcase_19: Edit Contact Business Unit
#    Edit Contact Business Unit
#
##Testcase_20: Delete Contact Business Unit
##    Delete Contact Business Unit
#
#Testcase_21: Search and Create Marketing Cycle
#    Search and Create Marketing Cycle
#
#Testcase_22: Edit Marketing Cycle
#    Edit Marketing Cycle
#
####Testcase_23: Delete Marketing Cycle
####    Delete Marketing Cycle
#
#Testcase_24: Create Marketing Cycle Detail
#    Create Marketing Cycle Detail
#
#Testcase_25: Edit Marketing Cycle Detail
#    Edit Marketing Cycle Detail
#
####Testcase_26: Delete Marketing Cycle Detail
####    Delete Marketing Cycle Detail
#
#Testcase_27: Click on Marketing Cycle Related Tab
#    Click on Marketing Cycle Related Tab
#
#Testcase_28: Create Target KPI
#    Create Target KPI
#
#Testcase_29: Edit Target KPI
#    Edit Target KPI
#
####Testcase_30: Delete Target KPI
####    Delete Target KPI
###
#
#Testcase_31: Create Contact TCL
#    Create Contact TCL
#
#Testcase_32: Edit Contact TCL
#    Edit Contact TCL
#
####Testcase_33: Delete Contact TCL
###    Delete Contact TCL