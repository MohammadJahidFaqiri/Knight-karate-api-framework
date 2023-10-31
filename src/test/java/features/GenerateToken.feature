Feature: Generate Token Feature

  Scenario: Generate Valid Token

    Given url "https://qa.insurance-api.tekschool-students.com"
    Then path "api/token"
    And request {"username": "supervisor","password": "tek_supervisor"}
    Then method post
    And status 200
