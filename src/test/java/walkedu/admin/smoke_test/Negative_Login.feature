Feature: Negative Login Test

  Scenario: login as admin
* url baseURL
* path '/auth/login'
* def adminLogin = read('classpath:data/adminNegativeLoginBody.json')
* request adminLogin
* method Post
* status 401
* assert response.message == "Kullanıcı email adresi ya da şifre hatalı."