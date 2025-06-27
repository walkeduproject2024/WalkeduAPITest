Feature: Get Sirket Arsivlenmis Ogrencilerini Getir - Company

  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"okurmahir7@gmail.com","password":"Walkedu.24"}
    * def authToken =  'Bearer '+myToken.Token
  Scenario: Get All Messages
    * url baseURL
    * path '/company-archieved-students'
    * header token = authToken
    And method Get
    * status 200
    * def responseJson = response
    * match responseJson.totalCount == 0
    * match responseJson.message == "Şirketteki pasif öğrenciler görüntülendi"

