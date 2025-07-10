Feature: PATCH Sirket Ogrencisini Pasif Hale Getirme - CompanySmokeTest

  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') { "email": "okurmahir7@gmail.com", "password": "Walkedu.24" }
    * def authToken = 'Bearer ' + myToken.Token

  Scenario: Aktif ogrenciyi pasif hale getirme
    * def studentId = '66f15588f28b544d6edf76cf'
    * url baseURL
    * path 'deactive-student', studentId
    * header Content-Type = 'application/json'
    * header token = authToken
    * request {}
    * method PATCH
    * status 200
    * def responseJson = response
    * assert response.message == "Öğrenci Pasif Hale Getirilmiştir"