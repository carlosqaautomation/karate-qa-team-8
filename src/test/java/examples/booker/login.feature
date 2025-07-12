Feature: Api login booker

  @login
  Scenario: CP01-Login Exitoso
    Given url urlBase
    And path 'auth'
    And form field username = 'admin'
    And form field password = 'password123'
    When method post
    Then status 200
    * print response.token
    * def authToken = response.token