Feature: Pruebas de api booker

  Background: Pre requisito test cases
    * def user = 'admin'
    * def password = 'password123'
    * def credentials = user+':'+password
    * def base64 = Java.type('java.util.Base64')
    * def encoded = base64.getEncoder().encodeToString(credentials.getBytes('UTF-8'))
    * def auth = 'Basic ' + encoded
    Given url urlBase

  Scenario: CP01 - Update booking
    * def id = 3233
    * def schemaUpdate = read('schema-update.json')
    * print schemaUpdate
    And path 'booking/' + id
    And header Authorization = auth
    And header Accept = 'application/json'
    And request
    """
    {
        "firstname" : "James",
        "lastname" : "Brown",
        "totalprice" : 111,
        "depositpaid" : true,
        "bookingdates" : {
            "checkin" : "2018-01-01",
            "checkout" : "2019-01-01"
        },
        "additionalneeds" : "Breakfast"
    }
    """
    When method put
    Then status 200
    And match response == schemaUpdate