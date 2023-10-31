Feature: Get Account with primary person ID

  Background: Setup test
    Given url "https://qa.insurance-api.tekschool-students.com"
    * def tokenResult = callonce read('GenerateToken.feature')
    And print tokenResult
    * def validToken = "Bearer "+ tokenResult.response.token


  Scenario: Testing endpoint /api/accounts/get-account
      # generating Token file then call it in any time we need to get token in another feature files
    # with * def tokenResult = callonce read('GenerateToken.feature')

    Given path "/api/accounts/get-account"
      * def expectedId = 500
      Then param primaryPersonId = expectedId
      Then header Authorization = validToken
      When method get
      Then status 200
      And print response
      #And assert response.primaryPerson.id == expectedId


  Scenario: Testing endpoint /api/accounts/get-account with primaryPersonId not exist

    Given path "/api/accounts/get-account"
    * def expectedId = 5000
    Then param primaryPersonId = expectedId
    Then header Authorization = validToken
    When method get
    Then status 404
    And assert response.httpStatus == "NOT_FOUND"
    And assert response.errorMessage == "Account with id " + expectedId + " not found"












