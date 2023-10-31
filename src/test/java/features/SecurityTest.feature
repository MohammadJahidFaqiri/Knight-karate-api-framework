Feature: Security Token API calls

  Scenario: Send request to /api/token
    Given url "https://qa.insurance-api.tekschool-students.com"
    And path "api/token"
    And request {"username": "supervisor", "password": "tek_supervisor"}
    When method post
    And print response
    Then status 200

#Activity
  #Endpoint: /api/token
  #Test with wrong Username
  #And status should be 404
  Scenario: Send request to /api/token with wrong username
    Given url "https://qa.insurance-api.tekschool-students.com"
    And path "api/token"
    #for multi line we can write like below example
    And request
                  """
                {
                "username": "wrongUsername",
                "password": "tek_supervisor"
                }
                  """
    When method post
    And print response
    Then status 404
    And assert response.httpStatus == "NOT_FOUND"
    And assert response.errorMessage == "User wrongUsername not found"

    Scenario: Send request to /api/token with wrong password
      Given url "https://qa.insurance-api.tekschool-students.com"
      And path "api/token"
      And request
                  """
                   {
                   "username": "supervisor",
                   "password": "wrongPassword"
                   }
                   """
      When method post
      And print response
      Then status 400
      And assert response.httpStatus == "BAD_REQUEST"
      And assert response.errorMessage == "Password not matched"









