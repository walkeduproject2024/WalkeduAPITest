Feature: Login Test - CompanySmokeTest

  Scenario: Kullanıcı başarılı şekilde sisteme giriş yapar
    * url baseURL
    * path '/auth/login'
    * request { email: 'okurmahir7@gmail.com', password: 'Walkedu.24' }
    * method POST
    * status 200
    * assert response.accessToken != null