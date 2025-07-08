Feature: Register

  Scenario: yeni email ile register olma(pozitive)
    * url 'https://walkedu.juniussoft.com/walkedu/api'
    * path '/auth/register'
    * def myBody = read('classpath:data/registerSmokeSema.json')
    * request myBody
    * method Post
    * status 201
    * match response.message == "Emailinize onaylama emaili gönderildi. Lütfen emailinizi onaylayınız."

  Scenario: zaten kullanılmıs bir email ile register olma(Negative)
    * url 'https://walkedu.juniussoft.com/walkedu/api'
    * path '/auth/register'
    * def myBody = read('classpath:data/registerSmokeSema.json')
    * request myBody
    * method Post
    * status 401
    * match response.message == "Bu email şu anda kullanımda."