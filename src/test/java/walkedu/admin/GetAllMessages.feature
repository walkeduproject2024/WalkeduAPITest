Feature: Get All Messages - Admin

   Background:
      * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"walkeduroot@gmail.com","password":"Walkedu.25"}
      * def authToken =  'Bearer '+myToken.Token
    Scenario: Get All Messages
    * url baseURL
    * path '/messages'
    * params {page:1,size:10}
    * header token = authToken
      And method Get
    * status 200
