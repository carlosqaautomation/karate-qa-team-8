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