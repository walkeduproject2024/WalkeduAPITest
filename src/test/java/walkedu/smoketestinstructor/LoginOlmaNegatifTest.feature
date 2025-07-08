Feature: Gerekli Bilgilerle Login Olunabilirlik Negatif Testi -Instructor
  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"sadikislar@itopiatech.com.tr","password":"Walkedu.25"}
    * def authToken =  'Bearer '+myToken.Token
  Scenario: Login olma
    * url baseURL
    * path '/auth/login'
    * header token = authToken
    * def myBody = read('classpath:data/loginezel.json')
    * request myBody
    * method post
    * status 400
    * assert response.userDetails.email == "sadikislar@itopiatech.com.tr"

  Scenario: Login olma
    * url baseURL
    * path '/auth/login'
    * header token = authToken
    * def myBody = read('classpath:data/loginezel.json')
    * request myBody
    * method post
    * status 200
    * assert response.userDetails.email == "sadıkislar@itopiatech.com.tr"

