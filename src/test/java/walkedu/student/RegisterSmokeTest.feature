Feature:  Smoke Test - Register (Kayıt olma)

  Background:
    * url baseURL
  Scenario: Register new member
    * path '/auth/register'
    * def myBody = read('classpath:data/RegisterSmokeTestDilek.json')
    * request myBody
    * method post
    * status 201
    * print response
    * match response.message == "Emailinize onaylama emaili gönderildi. Lütfen emailinizi onaylayınız."
