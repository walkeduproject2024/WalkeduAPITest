Feature: Egitmen Resminin Getirilebilirliği
  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"sadikislar@itopiatech.com.tr","password":"Walkedu.25"}
    * def authToken =  'Bearer '+myToken.Token
  Scenario: Egitmen Resminin Getirilebilirliği
    * url baseURL
    * path '/file/default-founder-6693a0a17380505922be42bc-1724940256139.jpg'
    * method Get
    * status 200