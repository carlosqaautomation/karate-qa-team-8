Feature:  Proceso de Reserva

Background:


  Scenario: CP01 - Generar Token
    * def BaseUrl = 'https://restful-booker.herokuapp.com'
    * def Autorizador = read('AutorizadorBasic.json')
    Given url BaseUrl
    And path 'auth'
    And request Autorizador
    When method POST
    Then status 200
    * print response.token


  Scenario: CP02 - Crear Reserva
    * def BaseUrl = 'https://restful-booker.herokuapp.com'
    Given url BaseUrl
    And path 'booking'
    And header Content-Type = 'application/json'
    And header Accept = '*/*'
    And request read('reserva.json')
    When method POST
    Then status 200
    * print response
    * print bookingId = response.bookingid


  Scenario: CP03 - Obtener Lista de Reserva por nombre,apellidos o fechas
    * def BaseUrl = 'https://restful-booker.herokuapp.com'
    Given url BaseUrl
    And path 'booking'
    And param firstname = 'Mire'
    And param lastname = 'Guia'
    # And param checkin = '2025-01-01'
    # And param checkout = '2026-01-01'
    When method GET
    Then status 200
    * print response
    * print bookingId = response[0].bookingid


  Scenario: CP04 - Obtener reserva por ID
    * def BaseUrl = 'https://restful-booker.herokuapp.com'
    * def id = 2609
    Given url BaseUrl
    And path '/booking/' + id
    And header Accept = 'application/json'
    When method GET
    Then status 200
    * print response

  Scenario: CP05 - Actualizar Reserva
    * def BaseUrl = 'https://restful-booker.herokuapp.com'
    * def id = 2609
    Given url BaseUrl
    And path '/booking/' + id
    And request
    """
    {
      "firstname" : "Gustavo",
      "lastname" : "perez",
      "totalprice" : 1111,
      "depositpaid" : false,
      "bookingdates" : {
        "checkin" : "2018-01-01",
        "checkout" : "2019-01-01"
       },
       "additionalneeds" : "Breakfast"
     }
    """
    And header Authorization = 'Basic YWRtaW46cGFzc3dvcmQxMjM='
    And header Content-Type = 'application/json'
    And header Accept = '*/*'
    When method PUT
    Then status 200
    * print response

  Scenario: CP06 - Actualizar nombres y apellidos de Reserva
    * def BaseUrl = 'https://restful-booker.herokuapp.com'
    * def id = 863
    Given url BaseUrl
    And path '/booking/' + id
    And header Authorization = 'Basic YWRtaW46cGFzc3dvcmQxMjM='
    And header Content-Type = 'application/json'
    And header Accept = '*/*'
    And request
    """
    {
    "firstname" : "Jorge",
    "lastname" : "Lopez"
    }
    """
    When method PATCH
    Then status 200
    * print response


  Scenario: CP07 - Eliminar Reserva
    * def BaseUrl = 'https://restful-booker.herokuapp.com'
    * def id = 1704
    Given url BaseUrl
    And path '/booking/' + id
    And header Authorization = 'Basic YWRtaW46cGFzc3dvcmQxMjM='
    And header Content-Type = 'application/json'
    When method DELETE
    Then status 201
    * print response










