Feature: İlgi Alanının Silinebilirliği-Instructer
  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"sadikislar@itopiatech.com.tr","password":"Walkedu.25"}
    * def authToken =  'Bearer '+myToken.Token
  Scenario: İlgi Alanının Silinebilirliği
    * url baseURL
    * path '/instructor-interest/66bb0a63dc2e132d28923ed0'
    * header token = authToken
    * method delete
    * status 204