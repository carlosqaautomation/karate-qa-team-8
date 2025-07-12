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
      |Paola     |Asencios   |120         |true        |2025-03-01|2018-01-01|Dinner      |
      |Karen     |Bocanegra   |200         |true        |2025-09-01|2018-01-01|Breakfast      |
      |Cecilia     |Rosadio   |350         |true        |2025-11-01|2018-01-01|Breakfast      |
      |Eldda     |Soberon   |210         |true        |2025-12-01|2018-01-01|Dinner      |
      |Hoty     |Montero   |160         |true        |2025-05-01|2018-01-01|Dinner      |
      |Juan     |Perez   |280         |true        |2025-10-01|2018-01-01|Breakfast and Dinner      |


  Scenario Outline: Generacion por csv and json
    Given url urlBase
    And path 'booking'
    And header Accept = 'application/json'
    And request read('bodyBooking.json')
    When method post
    Then status 200

    Examples:
      | read('dataCreate.csv') |


