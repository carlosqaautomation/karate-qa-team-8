Feature: Pruebas de PetStore

  Scenario: Case find by status pet
    Given url 'https://petstore.swagger.io/v2'
    And path 'pet/findByStatus'
    #query param
    And param status = 'sold,pending'
    When method get
    Then status 200


  #Caso 2: Api single user
  Scenario: Case find single user
    Given url "https://reqres.in"
    And path "api/user/2"
    When method get
    Then status 200

  #caso 3
  Scenario: Case find single user not found
    Given url "https://reqres.in"
    And header x-api-key = "reqres-free-v1"
    And path "api/user/24"
    When method get
    Then status 404

  #Caso 4: Api single user with variable
  Scenario: Case find single user with variable
    * def urlBase = 'https://reqres.in'
    * def idUser = 2
    Given url urlBase
    And path "api/user/" + idUser
    When method get
    Then status 200

  #Caso 4: Api single user with variable and prints
  Scenario: Case find single user with variable and prints
    * def urlBase = 'https://reqres.in'
    * def idUser = 2
    Given url urlBase
    And path "api/user/" + idUser
    When method get
    Then status 200
    * print response
    #And match response contains { "data": {"id":2,"name":"fuchsia rose","year":2001,"color":"#C74375","pantone_value":"17-2031"} }
    And match response.data contains { "id": 2}


  Scenario: Create User in petStore
    Given url "https://petstore.swagger.io/v2"
    And path "user"
    And request {"id": 0,"username": "carloszasa","firstName": "carlos","lastName": "zambrano santos","email": "carlos@gmail.com","password": "12345678","phone": "987654321","userStatus": 1}
    When method post
    Then status 200
    * print response

  @user
  Scenario: Create User in petStore with variable in line
    * def body = {"id": 0,"username": "carloszasa","firstName": "carlos","lastName": "zambrano santos","email": "carlos@gmail.com","password": "12345678","phone": "987654321","userStatus": 1}
    Given url "https://petstore.swagger.io/v2"
    And path "user"
    And request body
    When method post
    Then status 200
    * print response

  @user
  Scenario: Create User in petStore with variable in dostring
    * def body =
    """
    {
      "id": 0,
      "username": "carloszasa",
      "firstName": "carlos",
      "lastName": "zambrano santos",
      "email": "carlos@gmail.com",
      "password": "12345678",
      "phone": "987654321",
      "userStatus": 1
    }
    """
    Given url "https://petstore.swagger.io/v2"
    And path "user"
    And request body
    When method post
    Then status 200
    * print response


  Scenario Outline: Case find single user with variable and prints outline <idUser>
    * def urlBase = 'https://reqres.in'
    Given url urlBase
    And header x-api-key = "reqres-free-v1"
    And path "api/user/" + <idUser>
    When method get
    Then status 200
    * print response
    And match response.data contains { "id": <idUser>}
    Examples:
      |idUser  | name| pet|
      | 1      |     |    |
      | 2      |     |    |
      | 3      |     |    |