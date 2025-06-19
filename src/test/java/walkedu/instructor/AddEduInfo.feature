Feature: Add Edu Info
Background:
  * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"sadikislar@itopiatech.com.tr","password":"Walkedu.25"}
  * def authToken =  'Bearer '+myToken.Token
  Scenario: Add new edu ınformation
    * url baseURL
    * path '/instructor-edu'
    * header token = authToken
    * def myBody = read('classpath:data/eduInfo.json')
    * request myBody
    * method post
    * status 200
    * assert response[1].department == "Bilgisayar Mühendisliği"
