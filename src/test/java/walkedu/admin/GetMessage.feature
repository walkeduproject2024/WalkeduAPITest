Feature: Get Message - Admin

  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"walkeduroot@gmail.com","password":"Walkedu.25"}
    * def authToken =  'Bearer '+myToken.Token

    Scenario: Get message by ID
      * url baseURL
      * path '/messages/679d1b5b969afb9ec97fd2ce'
      * header token = authToken
      And method Get
      * status 200
      * assert response.name == "Test Messenger"
