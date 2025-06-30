Feature: Eğitmen Kişisel Bilgisi Güncellenebilirliği
  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"sadikislar@itopiatech.com.tr","password":"Walkedu.25"}
    * def authToken =  'Bearer '+myToken.Token
  Scenario: Kişisel Bilgi Güncelleme-Instructors
    * url baseURL
    * path '/update-instructor-self'
    * header token = authToken
    * def myBody = read('classpath:data/tel.json')
    * request myBody
    * method patch
    * status 200
    * assert response.other.aboutMe == "Eğitim her bireyin hakkıdır"