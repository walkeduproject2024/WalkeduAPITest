Feature: Diğer Bilginin Getirilebilirliği-Instructer
  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"sadikislar@itopiatech.com.tr","password":"Walkedu.25"}
    * def authToken =  'Bearer '+myToken.Token
  Scenario: Diğer Bilginin Getirilmesi
    * url baseURL
    * path '/instructor-other'
    * header token = authToken
    * method Get
    * status 200
    * assert response._id == "6827253a85fe3e6e38782e9b"