Feature: PATCH Sirket Ogrencisini Aktif Hale Getirme - Company

  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') { "email": "okurmahir7@gmail.com", "password": "Walkedu.24" }
    * def authToken = 'Bearer ' + myToken.Token

  Scenario: Arsivlenmis ogrenciyi tekrar aktif hale getirme
    * def studentId = '66f15588f28b544d6edf76cf'
    * url baseURL
    * path 'reactive-student', studentId
    * header Content-Type = 'application/json'
    * header token = authToken
    * request {}        # <--- PATCH için boş JSON body
    * method PATCH
    * status 200
    * def responseJson = response
    * assert response.message == "Öğrenci Aktif Hale Getirilmiştir"