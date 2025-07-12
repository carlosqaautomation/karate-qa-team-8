Feature: Generacion de datos dinamicos

  Scenario Outline: Generacion por csv
    Given url urlBase
    And path 'booking'
    And header Accept = 'application/json'
    And request
    """
    {
      "firstname" : "#(firstname)",
      "lastname" : "#(lastname)",
      "totalprice" : #(totalprice),
      "depositpaid" : #(depositpaid),
      "bookingdates" : {
        "checkin" : "#(checkin)",
        "checkout" : "#(checkout)"
      },
      "additionalneeds" : "#(additionalneeds)"
    }
    """
    When method post
    Then status 200

    Examples:
      | read('dataCreate.csv') |


  Scenario Outline: Generacion por oultine
    Given url urlBase
    And path 'booking'
    And header Accept = 'application/json'
    And request
    """
    {
      "firstname" : "<firstname>",
      "lastname" : "<lastname>",
      "totalprice" : <totalprice>,
      "depositpaid" : <depositpaid>,
      "bookingdates" : {
        "checkin" : "<checkin>",
        "checkout" : "<checkout>"
      },
      "additionalneeds" : "<additionalneeds>"
    }
    """
    When method post
    Then status 200

    Examples:
      | firstname |  lastname | totalprice | depositpaid|checkin|checkout|additionalneeds|
      |carlos     |zambrano   |111         |true        |2018-01-01|2018-01-01|book      |
      |abc     |zambrano   |111         |true        |2018-01-01|2018-01-01|book      |
      |pedro     |zambrano   |111         |true        |2018-01-01|2018-01-01|book      |
      |luis     |zambrano   |111         |true        |2018-01-01|2018-01-01|book      |
      |nicolas     |zambrano   |111         |true        |2018-01-01|2018-01-01|book      |
      |augusto     |zambrano   |111         |true        |2018-01-01|2018-01-01|book      |


  Scenario Outline: Generacion por csv and json
    Given url urlBase
    And path 'booking'
    And header Accept = 'application/json'
    And request read('bodyBooking.json')
    When method post
    Then status 200

    Examples:
      | read('dataCreate.csv') |




