Feature: Publisher login tests

  Background:
    * url baseURL
    * path '/auth/login'

  Scenario: Geçerli publisher bilgileri ile başarılı giriş
    * def publisherLogin = read('classpath:data/publisherLoginBody.json')
    * request publisherLogin
    * method post
    * status 200
    * assert response.userDetails.roles[1]== "Publisher"
    * match response.userDetails.roles contains "Publisher"

  Scenario: Geçersiz publisher bilgileri ile başarısız giriş
    * def publisherLogin = read('classpath:data/publisherLoginBodyNegative.json')
    * request publisherLogin
    * method Post
    * status 404
    * assert response.message == "Kullanıcı bulunamadı."



