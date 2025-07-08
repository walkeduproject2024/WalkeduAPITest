Feature: End2End Test Edilebilirlik-Instructor
  Background:

    * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"sadikislar@itopiatech.com.tr","password":"Walkedu.25"}
    * def authToken =  'Bearer '+myToken.Token
  Scenario:Login Olunabilirlik-End2EndTest
    * url baseURL
    * path '/auth/login'
    * header token = authToken
    * def myBody = read('classpath:data/loginezel.json')
    * request myBody
    * method post
    * status 200
    * assert response.userDetails.email == "sadikislar@itopiatech.com.tr"
  Scenario:Instructor Profiline Videonun Getirilebilirliği -End2EndTest
    * url baseURL
    * path '/instructor-videos'
    * header token = authToken
    * method Get
    * status 201
    * assert response.message == "Profilinizdeki videolar görüntülenmekte"

  Scenario:Instructor Profiline Getirilen  Videonun Guncellenebilmesi -End2EndTest
    * configure connectTimeout = 30000
    * configure readTimeout = 60000
    * url baseURL
    * path '/instructor-video/685bf7e13d6eb169f23b3f52'
    * header token = authToken
    And multipart field title = 'kişisel Gelişim 2'
    And multipart file replyVideo = { read: 'classpath:data/kisiselgelisim.mp4', filename: 'kisiselgelisim.mp4', contentType: 'video/mp4' }
    When method patch
    Then status 200
    * assert response.message == "Videonuz başarıyla güncellenmiştir."