Feature: Get Sirket Ogrencilerini Getir - Company

  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') { "email": "okurmahir7@gmail.com", "password": "Walkedu.24" }
    * def authToken = 'Bearer ' + myToken.Token

  Scenario: Gecersiz sayfa numarasi ile istek atilmasi durumunda hata alinmali
    * url baseURL
    * path '/company-students'
    * params { page: -1, size: 10 }
    * header token = authToken
    And method GET
    * status 400
    * def response = response
    * assert response.totalCount == 11
    * assert response.message == "Şirketteki aktif öğrenciler görüntülendi"

    # NOT: Bu negatif testte geçersiz sayfa numarası (page: -1) gönderilmiştir.
    # Ancak beklenen 400 Bad Request yerine 200 OK mesajı dönmektedir.