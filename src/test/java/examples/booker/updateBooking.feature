Feature: Update booking

  Background:
    * def login = call read('classpath:examples/booker/login.feature@login')
    * print login.authToken
    * def authToken = login.authToken

  Scenario: CP01-Update total booking
    * def id = 1
    Given url urlBase
    And path 'booking/' + id
    And header Accept = 'application/json'
    And header Cookie = 'token=' + authToken
    And request read('body-update.json')
    When method put
    Then status 200
