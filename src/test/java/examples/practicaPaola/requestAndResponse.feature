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
    And request read('bodyUser.json')
    When method post
    Then status 200


  Scenario: CP003
     * def bodyUser = read('bodyUser.json')
    Given url  'https://petstore.swagger.io/v2'
    And path 'user'
    And request bodyUser
    When method post
    Then status 200



Scenario: CP004
  Given url 'https://petstore.swagger.io/v2'
  And path 'pet/findByStatus'
  And param status = 'available'
  When method get
  Then status 200

Scenario: CP005
Given url 'https://petstore.swagger.io/v2'
And path '/user/login'
And form fields username = 'pasencios'
And form fields password = '123456'
When method get
  Then status 200

Scenario: CP006 - Buscar usuario con token
    * def id = 1
    Given url 'https://reqres.in'
    And path 'api/user/' + id
    And header Content-Type = 'application/json'
    And header Accept = 'application/json'
    And header x-api-key = 'reqres-free-v1'
    When method get
    Then status 200
    * print response
    And match response.data.year == 2000
    And match $.data.name == 'cerulean'

  Scenario: CP007
    Given url https://api.qateamperu.com
    And path '/api/v1/producto'
    And header Accept = 'application/json'
    When method get
    Then status 401

  Scenario: CP08 - Lista de productos con token
    Given url 'https://api.qateamperu.com'
    And path '/api/v1/producto'
    And header Accept = 'application/json'
    And header Authorization = 'Bearer 365|WasUsE31nI5cSoEr2IAX2u0zGmAQmbWo1Poct1u6'
    When method get
    Then status 200
    * print response
    And match responseType == 'json'
    And match response.data != null