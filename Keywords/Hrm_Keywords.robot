*** Settings ***
Library    SeleniumLibrary
Variables    ../Objects/Hrm_Objects.py
Variables    ../Resources/Test_Data.py

*** Variables ***
${url}    https://opensource-demo.orangehrmlive.com/
${login}    Admin
${password}    admin123

*** Keywords ***
Get Vacancy Name
    [Arguments]    ${prefix}
    ${time_in_ms}    Evaluate	int(round(time.time() * 1000))    time
    ${vacancy_name}    Catenate    ${prefix}${time_in_ms}
	[Return]    ${vacancy_name}
	
Open Web Page
    Open Browser    ${url}
    Maximize Browser Window
    
Close Browser And Take Screenshot
    Capture Page Screenshot    
    Close Browser   
    
Login To OrangeHRM
    Input Text    ${username_input}    ${login}
    Input Text    ${password_input}    ${password}
    Click Button    ${login_button}
    Wait Until Page Contains Element    ${recruitment_tab}    
    
Go To Vacancies
    Wait Until Element Is Visible    ${recruitment_tab}
    sleep    4
    Click Element    ${recruitment_tab}
    Wait Until Element Is Visible    ${vacancies_subtab}
    Wait Until Page Contains Element    ${vacancies_subtab}
    Click Element    ${vacancies_subtab}
    
Add New Vacancy
    [Arguments]    ${vacancy_name}
    Click Button    ${open_vacancy_form}
    Select From List By Label    ${job_title_select}  Sales Manager  
    Input Text    ${vacancy_name_input}    ${vacancy_name}
    Input Text    ${hiring_manager_input}    Bollywood Actor
    Input Text    ${number_of_positions_input}    4
    Input Text    ${description_textarea}    Super mega cool job
    Click Element    ${save_vacancy_button}
    
Delete New Vacancy 
    [Arguments]    ${vacancy_name}
    Wait Until Page Contains Element    //*[contains(text(), '${vacancy_name}')]/../../td[*]//input[contains(@type, 'checkbox')]    
    Select Checkbox    //*[contains(text(), '${vacancy_name}')]/../../td[*]//input[contains(@type, 'checkbox')]
    Click Button    ${delete_vacancy_button}
    Click Element    ${confirm_deletion_button}
    