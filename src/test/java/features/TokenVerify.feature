Feature: Security token verify API calls

  Background: Setup tests
    #Background url it will run at begin of each scenario
    #dont need to repeat url in every scenario
    Given url "https://qa.insurance-api.tekschool-students.com"

  Scenario: Send valid request to api/token/verify

    And path "api/token"
    And request {"username": "supervisor", "password": "tek_supervisor"}
    When method post
    Then status 200
    And print response
    And path "/api/token/verify"
    And param username = "supervisor"
    And param token = response.token
    When method get
    Then status 200
    And print response
    And assert response.message == "Token is valid"
    And assert response.httpStatus == "OK"

   Scenario: Send valid username invalid token to /api/token/verify
     And path "/api/token/verify"
     And param username = "supervisor"
     And param token = "wrong Token"
     When method get
     Then status 400
     And print response
     And assert response.errorMessage == "Token Expired or Invalid Token"
     And assert response.httpStatus == "BAD_REQUEST"


     Scenario: Send invalid user and valid token to /api/token/verify
       And path "api/token"
       And request {"username": "supervisor", "password": "tek_supervisor"}
       When method post
       Then status 200
       And print response
       And path "/api/token/verify"
       And param username = "wrongUserName"
       And param token = response.token
       When method get
       Then status 400
       And print response
       And assert response.errorMessage == "Wrong Username send along with Token"
       And assert response.httpStatus == "BAD_REQUEST"



