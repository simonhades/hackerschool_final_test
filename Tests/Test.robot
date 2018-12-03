*** Settings ***
Resource    ../Keywords/Hrm_Keywords.robot
Variables    ../Objects/Hrm_Objects.py
Variables    ../Resources/Test_Data.py
Library    SeleniumLibrary    

*** Variables ***
${prefix}    your own prefix
${url}    ######
${browser}    chrome

*** Test Cases ***
Test
    ${vacancy_name}    Get Vacancy Name    ${prefix}