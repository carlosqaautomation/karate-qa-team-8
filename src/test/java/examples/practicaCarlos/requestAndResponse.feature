Feature: Ejercicios de Request y Response

  Scenario: CP01 - Crear usuario con docString
    Given url 'https://petstore.swagger.io/v2'
    And path 'user'
    And request
    """
    {
      "id": 0,
      "username": "carlosqa",
      "firstName": "carlos",
      "lastName": "zambrano",
      "email": "carlos@gmail.com",
      "password": "123456",
      "phone": "987655543",
      "userStatus": 1
     }
    """
    When method post
    Then status 200
    * print response
    And match responseType == 'json'
    And match response.code == 200


  Scenario: CP02 - Crear usuario con archivo JSON
    Given url 'https://petstore.swagger.io/v2'
    And path 'user'
    And request read('bodyUser.json')
    When method post
    Then status 200

  Scenario: CP03 - Crear usuario con archivo JSON
    * def bodyUser = read('bodyUser.json')
    Given url 'https://petstore.swagger.io/v2'
    And path 'user'
    And request bodyUser
    When method post
    Then status 200

  Scenario: CP04 - Filtrar estados de mascotas
    Given url 'https://petstore.swagger.io/v2'
    And path 'pet/findByStatus'
    And param status = 'pending'
    When method get
    Then status 200
    
  Scenario: CP05 - Login con form data
    Given url 'https://petstore.swagger.io/v2'
    And path '/user/login'
    And form field username = 'carlosqa'
    And form field password = '123456'
    When method get
    Then status 200

  Scenario: CP06 - Buscar usuario con token
    * def id = 1
    Given url 'https://reqres.in'
    And path 'api/user/' + id
    And header x-api-key = 'reqres-free-v1'
    When method get
    Then status 200
    And match response.data.year == 2000
    And match $.data.name == 'cerulean'


  Scenario: CP07 - Lista de productos sin token
    Given url 'https://api.qateamperu.com'
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