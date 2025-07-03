Feature: Register

  Scenario: register new member
    * url 'https://walkedu.juniussoft.com/walkedu/api'
    * path '/auth/register'
    * def newUserBody = read('classpath:data/registerSmokeYavuz.json')
    * request newUserBody
    * method Post
    * status 201
    * match response.message == "Emailinize onaylama emaili gönderildi. Lütfen emailinizi onaylayınız."

  Scenario: register new member with existed e-mail (Negative)
    * url 'https://walkedu.juniussoft.com/walkedu/api'
    * path '/auth/register'
    * def newUserBody = read('classpath:data/registerSmokeYavuz.json')
    * request newUserBody
    * method Post
    * status 401
    * match response.message == "Bu email şu anda kullanımda."