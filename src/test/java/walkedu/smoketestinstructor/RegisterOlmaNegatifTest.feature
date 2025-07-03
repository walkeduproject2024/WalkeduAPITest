Feature: Gerekli Bilgilerle Register Olunabilirlik -Instructor
  Scenario: Register olma
    * url 'https://walkedu.juniussoft.com/walkedu/api'
    * path '/auth/register'
    * def myBody = read('classpath:data/registerezel.json')
    * request myBody
    * method post
    * status 200
    * match response.message == "Emailinize onaylama emaili gönderildi. Lütfen emailinizi onaylayınız."


  Scenario: Register olma
    * url 'https://walkedu.juniussoft.com/walkedu/api'
    * path '/auth/register'
    * def myBody = read('classpath:data/registerezel.json')
    * request myBody
    * method post
    * status 201
    * match response.message == "Emailinize onaylama emaili gönderildi.Lütfen emailinizi onaylayınız."