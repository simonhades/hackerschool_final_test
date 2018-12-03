*** Settings ***
Resource    ../Keywords/Hrm_Keywords.robot
Variables    ../Objects/Hrm_Objects.py
Variables    ../Resources/Test_Data.py
Library    SeleniumLibrary  

test setup    Open Web Page
test teardown      Close Browser And Take Screenshot

*** Variables ***
${prefix}    sistest
${url}    https://opensource-demo.orangehrmlive.com/
${browser}    chrome

*** Test Cases ***
Test
    ${vacancy_name}    Get Vacancy Name    ${prefix}
    Login To OrangeHRM
    Go To Vacancies
    Add New Vacancy    ${vacancy_name}
    Go To Vacancies
    Page Should Contain    ${vacancy_name}
    Delete New Vacancy    ${vacancy_name}
    Page Should Not Contain    ${vacancy_name}    
