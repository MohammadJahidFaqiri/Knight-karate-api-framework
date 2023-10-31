Feature: Plan Code Testing

  Background: Setup test
    Given url "https://qa.insurance-api.tekschool-students.com"

  Scenario: Validate /api/plans/get-all-code
    And path "api/token"
    And request {"username": "supervisor", "password": "tek_supervisor"}
    When method post
    Then status 200
    And print response
    * def validToken = "Bearer " + response.token
    Given path "/api/plans/get-all-plan-code"
    # instead of  ("Bearer " + response.token) in line 17 we can create
    # variable * def <name> = "Bearer " + response.token
    # and then we can write the name of that variable in header.
    And header Authorization = validToken
    When method get
    Then status 200
    And print response
    And assert response[0].planExpired == false
    And assert response[1].planExpired == false
    And assert response[2].planExpired == false
    And assert response[3].planExpired == false



