Feature: Get Sirket Ogrencilerini Getir - Company

  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"okurmahir7@gmail.com","password":"Walkedu.24"}
    * def authToken =  'Bearer '+myToken.Token
  Scenario: Get All Messages
    * url baseURL
    * path '/company-students'
    * params {page:8,size:10}
    * header token = authToken
    And method Get
    * status 200
    * def response = response
    * assert response.totalCount == 10
    * assert response.message == "Şirketteki aktif öğrenciler görüntülendi"
