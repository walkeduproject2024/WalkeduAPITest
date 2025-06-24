Feature: (Negative)Get Message - Admin

  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"walkeduroot@gmail.com","password":"Walkedu.25"}
    * def authToken =  'Bearer '+myToken.Token

  Scenario:  Get message with invalid ID
    * url baseURL
    * path '/messages/679d2c78969afb9ec97fdb84'
    * header token = authToken
    And method Get
    * status 404
    * assert response.message == "Mesaj bulunamadı."

  Scenario:  Get message with non-numeric ID
    * url baseURL
    * path '/messages/abcabcabc'
    * header token = authToken
    And method Get
    * status 400
    * assert response.message == "Invalid id format"

  Scenario:  Get message without authorization
    * url baseURL
    * path '/messages/679d2c78969afb9ec97fdb83'
    And method Get
    * status 401
    * assert response.message == "Lütfen giriş yapınız."
