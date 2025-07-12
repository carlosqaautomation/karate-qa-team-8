Feature: Buscar libro

  Background:
    * def create = call read('classpath:examples/booker/createBooking.feature')
    * def authToken = create.authToken
    * def id = create.bookingId
    * print authToken, id

  Scenario: CP01-Buscar libro por id
    * def bodyValidator = read('body-create.json')
    * print bodyValidator
    Given url urlBase
    And path 'booking/' + id
    And header Accept = 'application/json'
    And header Cookie = 'token=' + authToken
    When method get
    Then status 200
    And match response.firstname == bodyValidator.firstname
    And match response.lastname == bodyValidator.lastname
    And match response.totalprice == bodyValidator.totalprice