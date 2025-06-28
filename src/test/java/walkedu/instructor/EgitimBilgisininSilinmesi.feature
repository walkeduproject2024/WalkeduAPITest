Feature: Eğitim Bilgisinin Silinmesi-Instructer
  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"sadikislar@itopiatech.com.tr","password":"Walkedu.25"}
    * def authToken =  'Bearer '+myToken.Token
  Scenario: Egitim Bilgisinin Silinmesi
    * url baseURL
    * path '/instructor-edu/6852f88c0dffbb5936106fb5'
    * header token = authToken
    * method Delete
    * status 204