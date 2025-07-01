Feature: Get Öğrenci Profili Görüntüleme- Student

  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"dilekkeserci@hotmail.com","password":"Walkedu.24"}
    * def authToken = 'Bearer ' + myToken.Token

    Scenario:  Öğrenci profili görüntüleme
      * url baseURL
      * path  '/student/profile'
      * header token = authToken
      * method Get
      * status 200
      * match response._id == '685c3d3ddba4636ef456ffb4'