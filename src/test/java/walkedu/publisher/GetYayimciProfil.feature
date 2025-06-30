Feature: Get Yayimci Profil
Background:
  * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"semaozdemiraslan@gmail.com","password":"Walkedu.24"}
  * def authToken =  'Bearer '+myToken.Token
  Scenario: Get Yayimci Profil
    * url baseURL
    * path '/publisher-profile'
    * header token = authToken
    * method Get
    * status 200
    * def userName = response.profile.user.name
    * assert userName == "Yeni Sema Yayımcılık"

