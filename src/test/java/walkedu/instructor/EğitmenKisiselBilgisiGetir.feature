Feature: Egitmen Kisisel Bilgisini Getirme-Instructers
  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"sadikislar@itopiatech.com.tr","password":"Walkedu.25"}
    * def authToken =  'Bearer '+myToken.Token
  Scenario: Get Eğitmen Kisisel Bilgisi
    * url baseURL
    * path '/instructor-self'
    * header token = authToken
    * method Get
    * status 200
