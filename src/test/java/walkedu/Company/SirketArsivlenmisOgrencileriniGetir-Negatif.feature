Feature: Get Sirket Arsivlenmis Ogrencilerini Getir - Negatif Test (Token Yok)

  Scenario: Token olmadan istek atıldığında yetkisiz erişim hatası alınmalı
    * url baseURL
    * path '/company-archieved-students'
    # Test için token başlığı gönderilmiyor!
    And method GET
    * status 401
    * match response.message == "Lütfen giriş yapınız."