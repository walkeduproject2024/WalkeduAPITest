Feature: Eğitmen Profilindeki Videoların Getirilebilirliği
  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"sadikislar@itopiatech.com.tr","password":"Walkedu.25"}
    * def authToken =  'Bearer '+myToken.Token
  Scenario: Video Getirilmesi-Instructors
    * url baseURL
    * path '/instructor-videos'
    * header token = authToken
    * method Get
    * status 201
    * assert response.message == "Profilinizdeki videolar görüntülenmekte"
