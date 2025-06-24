Feature: Update Message - Admin

  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"walkeduroot@gmail.com","password":"Walkedu.25"}
    * def authToken =  'Bearer '+myToken.Token

  Scenario: Update existing message
    * url baseURL
    * path '/messages/679d1b5b969afb9ec97fd2ce'
    * header token = authToken
    * def msgBody = read('classpath:data/messageUpdateBody.json')
    * request msgBody[0]
    * method Put
    * status 200
    * assert response.message == "Test text message"