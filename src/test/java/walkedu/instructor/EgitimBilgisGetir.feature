Feature: Eğitim Bilgisinin Getirilmesi-Instructors
  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"sadikislar@itopiatech.com.tr","password":"Walkedu.25"}
    * def authToken =  'Bearer '+myToken.Token
  Scenario: Eğitim Bilgisini Getirme
    * url baseURL
    * path '/instructor-edu'
    * header token = authToken
    * method Get
    * status 200
    * assert response.education[0].graduationDate == "2014-07-15T00:00:00.000Z"
