*** Settings ***
Documentation  Test to verify that a user can book a car.
...            Test will navigate from start page and log in with a existed account.

Resource  ../Resources/keywords.robot
Library  SeleniumLibrary
Library  DateTime

*** Variables ***

${BROWSER}  chrome
${BROWSER}  headlesschrome

${URL}  http://rental7.infotiv.net

*** Test Cases ***
Valid Login
    [Tags]  VG-test
    Given Browser is opened to start page
    When User logs in with valid password
    Then You are signed in page should be opened

Choose Date To Rent
    [Tags]  VG-test
    Given User is in you are signed in page
    When User choose rental date
    Then What would you like to drive page should be opened

Choose Car
    [Tags]  VG-test
    Given User is in what would you like to drive page
    When User choose car
    Then Confirm booking car page should be opened

Pay For Rent
    [Tags]  VG-test
    Given User is in confirm booking car page
    When User submit credentials
    Then Your car is ready to pick up page should be opened

Cancel Booking
    [Tags]  VG-test
    Given User is in mypage
    When User cancel booking
    Then Your car has been returned page should be opened