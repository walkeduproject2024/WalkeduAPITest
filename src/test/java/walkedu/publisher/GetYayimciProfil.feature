Feature: Add Edu Info
Background:
  * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"semaozdemiraslan@gmail.com","password":"Walkedu.24"}
  * def authToken =  'Bearer '+myToken.Token
  Scenario: Add new edu ınformation
    * url baseURL
    * path '/publisher-profile'
    * header token = authToken
    * def myBody = read('classpath:data/eduInfo.json')
    * request myBody
    * method post
    * status 200
    * assert response[1].department == "Bilgisayar Mühendisliği"
