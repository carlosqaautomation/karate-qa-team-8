Feature: Ejercicios Booker

Scenario: CP001 - Generar token
Given url  'https://restful-booker.herokuapp.com'
And path 'auth'
And request
"""
   { "username" : "admin",
     "password" : "password123"
   }
"""
When method post
Then status 200
* print response


 Scenario: CP002 - GetBookingIds
 Given url  'https://restful-booker.herokuapp.com'
 And path 'booking'
 When method get
 Then status 200
 * print response

Scenario: CP003 Case Get booking
* def id = 1
Given url 'https://restful-booker.herokuapp.com/booking/' + id
And header Accept =  'application/json'
When method get
Then status 200
* print response



Scenario: CP004 Case create booking
* def body =
  """
  {
  "firstname" : "Scott",
  "lastname" : "Disick",
  "totalprice" : 111,
  "depositpaid" : true,
  "bookingdates" : {
  "checkin" : "2025-08-01",
  "checkout" : "2025-08-07"
  },
  "additionalneeds" : "Breakfast"
  }
  """
Given url 'https://restful-booker.herokuapp.com/booking'
And request body
And header Content-Type = 'application/json'
And header Accept =  'application/json'
When method post
Then status 200
* print response.bookingid



Scenario: CP005 Case update booking
* def BookingId = 1
* def body =
"""
{
   "firstname": "Scott",
   "lastname": "Disick",
   "totalprice": 300,
   "depositpaid": false,
   "bookingdates": {
        "checkin": "2025-08-01",
        "checkout": "2025-08-08"
    },
   "additionalneeds": "Breakfast and Dinner"
 }
  """
Given url 'https://restful-booker.herokuapp.com/booking/' + BookingId
And request body
And header Content-Type = 'application/json'
And header Accept =  'application/json'
And header Cookie = 'token=abc123'
And header Authorization = 'Basic YWRtaW46cGFzc3dvcmQxMjM='
When method put
Then status 200



Scenario: CP006 Case partial update booking
* def BookingId = 1
* def body =
"""
{
   "firstname": "James",
   "lastname": "Brown"
 }
  """
 Given url 'https://restful-booker.herokuapp.com/booking/' + BookingId
 And request body
 And header Content-Type = 'application/json'
 And header Accept =  'application/json'
 And header Cookie = 'token=abc123'
 And header Authorization = 'Basic YWRtaW46cGFzc3dvcmQxMjM='
 When method PATCH
 Then status 200



Scenario: CP007 Case Delete booking
* def id = 3517
Given url 'https://restful-booker.herokuapp.com/booking/' + id
And header Content-Type = 'application/json'
And header Accept =  'application/json'
And header Cookie = 'token=abc123'
And header Authorization = 'Basic YWRtaW46cGFzc3dvcmQxMjM='
When method delete
Then status 201
* print response

