Feature: Create booking

  Background:
    * def login = call read('classpath:examples/booker/login.feature@login')
    * print login.authToken
    * def authToken = login.authToken

  Scenario: CP01 - Crear un libro
    Given url urlBase
    And path 'booking'
    And header Accept = 'application/json'
    And header Cookie = 'token=' + authToken
    And request read('body-create.json')
    When method post
    Then status 200
    * print response.bookingid
    * def bookingId = response.bookingid



