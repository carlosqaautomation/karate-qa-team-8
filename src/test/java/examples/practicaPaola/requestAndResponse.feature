Feature: Ejercicios de Request y Response

  Scenario: CP001
Given url  'https://petstore.swagger.io/v2'
  And path 'user'
And request
"""
  {
  "id": 0,
  "username": "kbocanegra",
  "firstName": "Karen",
  "lastName": "Bocanegra",
  "email": "kbocanegratest@gmail.com",
  "password": "123456",
  "phone": "999999999",
  "userStatus": 0
  }
"""
 When method post
 Then status 200
 * print response



  Scenario: CP002
    Given url  'https://petstore.swagger.io/v2'
    And path 'user'
    And request read{'bodyUser.json'}
    When method post
    Then status 200

Scenario: CP003
  Given url https://petstore.swagger.io/v2/
  And path 'pet/findByStatus'
  And param status = 'available'
  When method get
  Then status 200



