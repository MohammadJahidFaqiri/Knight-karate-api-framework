Feature: Create Account Testing

  Background: Setup Test
    Given url "https://qa.insurance-api.tekschool-students.com"
    * def tokenResult = callonce read('GenerateToken.feature')
    And print tokenResult
    * def validToken = "Bearer " + tokenResult.response.token

  Scenario: Create Account endPoint /api/accounts/add-primary-account

    Given path "/api/accounts/add-primary-account"
    Then request
    """
    {
  "email": "Elaha.Hamid@gmail.com",
  "firstName": "Elaha",
  "lastName": "Hamid",
  "title": "Miss ",
  "gender": "FEMALE",
  "maritalStatus": "SINGLE",
  "employmentStatus": "Doctor",
  "dateOfBirth": "1990-12-20",
    }
    """
    And header Authorization = validToken
    When method post
    And print response
    Then status 201
    And assert response.email == "Elaha.Hamid@gmail.com"

