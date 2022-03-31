*** Keywords ***

Browser is opened to start page
    ${chrome_options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    test-type
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Create Webdriver    Chrome    chrome_options=${chrome_options}

    # Open Browser  about:blank  ${BROWSER}
    Go To  ${URL}

User logs in with valid password
    Input Username
    Input Password
    Submit Credentials

Input Username
    Wait Until Page Contains Element  id:email
    Input Text  id:email  test@test.se

Input Password
    Wait Until Page Contains Element  id:password
    Input Text  id:password  testtest

Submit Credentials
    Wait Until Page Contains Element  id:login
    Click Element  id:login

You are signed in page should be opened
    Wait Until Element Contains  id:welcomePhrase  You are signed in as

User is in you are signed in page
    Element Should Contain  id:welcomePhrase  You are signed in as

User choose rental date
    CLick Element  id:continue

What would you like to drive page should be opened
    Wait Until Element Contains  id:questionText  What would you like to drive?

User is in what would you like to drive page
    Element Should Contain  id:questionText  What would you like to drive?

User choose car
    Wait Until Page Contains Element  id:bookTTpass5
    Click Element  id:bookTTpass5

Confirm booking car page should be opened
    Wait Until Element Contains  id:questionText  Confirm booking of

User is in confirm booking car page
    Element Should Contain  id:questionText  Confirm booking of

User submit credentials
    Input text  id:cardNum  1234567891234567
    Input text  id:fullName  Bamse Sjöberg
    Input text  id:cvc  123
    Click Button  id:confirm

Your car is ready to pick up page should be opened
    Wait Until Element Contains  id:questionTextSmall  is now ready for pickup

User is in mypage
    Wait Until Element Contains  id:questionTextSmall  is now ready for pickup
    Click Element  id:mypage
    Element Should Contain  id:historyText  My bookings

User cancel booking
    Wait Until Element Contains  id:historyText  My bookings
    Click Element  //*[@id="unBook1"]
    Handle Alert  Accept

Your car has been returned page should be opened
    Wait Until Location Contains  http://rental7.infotiv.net/webpage/html/includes/unBooking.inc.php
    Close Browser

