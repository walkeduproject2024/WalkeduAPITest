Feature: Kullanıcı Giriş - Login Smoke Test

  Scenario: Test test adlı kayıtlı kullanıcı sisteme giriş yapabilmeli

    * url baseURL
    * path '/auth/login'
    * request
  """
  {
    "email": "birincitest1@hotmail.com",
    "password": "Walkedu.24"
  }
  """
    * method post
    * status 200
    * print response
    * match response.accessToken == '#string'
    * match response.userDetails.email == 'birincitest1@hotmail.com'





