Feature: Kişisel Bilginin Getirilebilirliği-Instructors
  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"sadikislar@itopiatech.com.tr","password":"Walkedu.25"}
    * def authToken =  'Bearer '+myToken.Token
  Scenario: Kişisel Bilginin Getirilmesi
  * url baseURL
  * path '/instructor-self'
    * header token = authToken
    * method get
    * status 200
    * assert response.gender == "Female"
