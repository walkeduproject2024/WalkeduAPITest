Feature: Kullanıcı Kayıt - Negatif Smoke Test

  Scenario: Şifre alanı boş bırakıldığında kayıt başarısız olmalı
    * url baseURL
    * path '/auth/register'
    * request
    """
    {
      "name": "Test User",
      "email": "testuser_negatif@example.com",
      "tel": "+90123456789",
      "password": "",
      "confirmPassword": "",
      "termsAgreement": true,
      "privacyPolicyAgreement": true
    }
    """
    * method post
    * status 400
    * match response.type == "ValidationError"
    * match response.details == "Şifre alanı boş olamaz."
