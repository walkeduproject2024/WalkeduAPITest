Feature: Update Message Negative Tests - Admin

  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"walkeduroot@gmail.com","password":"Walkedu.25"}
    * def authToken =  'Bearer '+myToken.Token

  Scenario: Update existing message with a name included number
    * url baseURL
    * path '/messages/679d1b5b969afb9ec97fd2ce'
    * header token = authToken
    * def msgBody = read('classpath:data/messageUpdateBody.json')
    * request msgBody[1]
    * method Put
    * status 400
    * assert response.details == "Ad ve soyad yalnızca harflerden oluşmalı ve en az iki kelime içermelidir."


  Scenario: Update existing message with an invalid e-mail address
    * url baseURL
    * path '/messages/679d1b5b969afb9ec97fd2ce'
    * header token = authToken
    * def msgBody = read('classpath:data/messageUpdateBody.json')
    * request msgBody[2]
    * method Put
    * status 400
    * assert response.details == "Email doğru formatta değil."

  Scenario: Update existing message with an invalid tel info
    * url baseURL
    * path '/messages/679d1b5b969afb9ec97fd2ce'
    * header token = authToken
    * def msgBody = read('classpath:data/messageUpdateBody.json')
    * request msgBody[3]
    * method Put
    * status 400
    * assert response.details == "Telefon numarası doğru formatta değil."

  Scenario: Update existing message with an invalid message ID
    * url baseURL
    * path '/messages/679d1b5b969afb9ec97fd2cf'
    * header token = authToken
    * def msgBody = read('classpath:data/messageUpdateBody.json')
    * request msgBody[0]
    * method Put
    * status 404
    * assert response.message == "Mesaj bulunamadı."

  Scenario: Update existing message without authorization
    * url baseURL
    * path '/messages/679d1b5b969afb9ec97fd2cf'
    * def msgBody = read('classpath:data/messageUpdateBody.json')
    * request msgBody[0]
    * method Put
    * status 401
    * assert response.message == "Lütfen giriş yapınız."