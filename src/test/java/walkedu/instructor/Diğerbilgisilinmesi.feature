Feature: Diğer Bilginin Silinebilirliği-Instructer
  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"sadikislar@itopiatech.com.tr","password":"Walkedu.25"}
    * def authToken =  'Bearer '+myToken.Token
  Scenario: Diğer Bilginin Silinmesi
    * url baseURL
    * path '/instructor-interest/66baf2c8dc2e132d28923eb7'
    * header token = authToken
    * method Delete
    * status 204