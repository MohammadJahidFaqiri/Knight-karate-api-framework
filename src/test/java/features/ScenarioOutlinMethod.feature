Feature: Security Token API calls
  Scenario Outline: Send request to /api/token
    Given url "https://qa.insurance-api.tekschool-students.com"
    And path "api/token"
    And request
                """
                {
                "username": "<data_username>",
                "password": "<data_password>"
                }
                """
    When method post
    And print response
    Then status <expectedStatus>
    And assert response.httpStatus == "<httpStatus>"
    And assert response.errorMessage == "<errorMessage>"

    Examples:
    |data_username  |data_password   |expectedStatus|httpStatus    |errorMessage                  |
    | wrongUsername | tek_supervisor | 404          | NOT_FOUND    | User wrongUsername not found |
    | supervisor    | wrongPassword  | 400          | BAD_REQUEST  | Password not matched         |

