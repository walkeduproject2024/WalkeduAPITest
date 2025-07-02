Feature: Videonun Silinebilirliği-Instructer
  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"sadikislar@itopiatech.com.tr","password":"Walkedu.25"}
    * def authToken =  'Bearer '+myToken.Token
  Scenario: Videonun Silinmesi
    * url baseURL
    * path '/instructor-video/6852f183d1f00a8cf4f619bd'
    * header token = authToken
    *  method delete
    * status 204
