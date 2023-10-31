Feature: Creating and Delete the account

Background: Setup Test
Given url "https://qa.insurance-api.tekschool-students.com"
* def tokenResult = callonce read('GenerateToken.feature')
And print tokenResult
* def validToken = "Bearer " + tokenResult.response.token

  Scenario: Create And Delete Account

Given path "/api/accounts/add-primary-account"
Then request
"""
    {
  "email": "Adam.Saleh11@gmail.com",
  "firstName": "Jhon",
  "lastName": "Hammac",
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
And assert response.email == "Adam.Saleh11@gmail.com"
  * def createdAccountId = response.id
Given path "/api/accounts/delete-account"
And param primaryPersonId = createdAccountId
  And header Authorization = validToken
  When method delete
  Then status 200
  And print response
  And assert response.message == "Account Successfully deleted"

