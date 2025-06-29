Feature: Get Sirket Ogrencilerini Getir - Company

  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"okurmahir7@gmail.com","password":"Walkedu.24"}
    * def authToken =  'Bearer '+myToken.Token
  Scenario: Gecersiz sayfa numarasi ile istek atilmasi durumunda hata alinmali
    * url baseURL
    * path '/company-students'
    * params {page:-1,size:10}
    * header token = authToken
    And method Get
    * status 400
    * def response = response

    # "SirketOgrencileriniGetir.feature:12 - status code was: 200, expected: 400, response time: 495," sonucu dönmekte.
    # * assert response.totalCount == 11
    # * assert response.message == "Şirketteki aktif öğrenciler görüntülendi"
