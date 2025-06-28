Feature: Egitmen Kisisel Bilgilerini Güncelleme
  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"sadikislar@itopiatech.com.tr","password":"Walkedu.25"}
    * def authToken =  'Bearer '+myToken.Token
  Scenario: Kisisel Bilgileri Güncelleme
    * url baseURL
    * path '/update-instructor-self'
    * header token = authToken
    * def myBody = read('classpath:data/tel.json')
    * request myBody
    * method patch
    * status 200
    * assert response.gender == "Female"