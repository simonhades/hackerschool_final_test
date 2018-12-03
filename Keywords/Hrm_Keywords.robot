*** Settings ***
Library    SeleniumLibrary
Variables    ../Objects/Hrm_Objects.py
Variables    ../Resources/Test_Data.py

*** Keywords ***
Get Vacancy Name
    [Arguments]    ${prefix}
    ${time_in_ms}    Evaluate	int(round(time.time() * 1000))    time
    ${vacancy_name}    Catenate    ${prefix}${time_in_ms}
	[Return]    ${vacancy_name}