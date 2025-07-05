Feature: Ejercicio de Request y response

  Scenario: CP01 - crear usuario con docString
    Given url 'https://petstore.swagger.io/v2'
    And path 'user'
    And request
    """
      {
          "id": 0,
          "username": "string",
          "firstName": "string",
          "lastName": "string",
          "email": "string",
          "password": "string",
          "phone": "string",
           "userStatus": 0
      }
    """
When method post
    Then status 200
    * print response
    And match responseType == 'json'
    And match response.code == 200

    Scenario: CP02 - Crear usuario con Archico JSON
      Given url 'https://petstore.swagger.io/v2'
      And path 'user'
      And request read('bodyUser.json')
      When method post
      Then status 200

  Scenario: CP03 - Crear usuario con Archico JSON
    * def bodyUser = ('bodyUser.json')
    Given url 'https://petstore.swagger.io/v2'
    And path 'user'
    And request bodyUser
    When method post
    Then status 200
    
    Scenario: CP04 - Filtrar estados de mascotas
      Given url 'https://petstore.swagger.io/v2'
      And path 'pet/findByStatus'
      And params Status = 'pending'
      When method get
      Then status 200
