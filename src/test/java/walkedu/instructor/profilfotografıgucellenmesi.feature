Feature: Profil Fotografının Guncellenebilirligi-Instructers
  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"sadikislar@itopiatech.com.tr","password":"Walkedu.25"}
    * def authToken =  'Bearer '+myToken.Token
  Scenario: Profil Fotografının Güncellenebilirliği
    * url baseURL
    * path '/update-instructor-img'
    * header token = authToken
    * multipart field title = 'img'
    * multipart file img = { read: 'classpath:data/resmim.jpeg', filename: 'resmim.jpeg', contentType: 'image/jpeg'  }
    * method patch
    * status 201
    * assert response._id == "66f13587f28b544d6edf72d4"