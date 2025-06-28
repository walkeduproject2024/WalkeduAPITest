Feature: Diğer Bilginin Eklenebilirliği-Instructer
  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"sadikislar@itopiatech.com.tr","password":"Walkedu.25"}
    * def authToken =  'Bearer '+myToken.Token
  Scenario: Diğer Bilginin Eklenmesi
    * url baseURL
    * path '/instructor-interest'
    * header token = authToken
    * def myBody = read('classpath:data/digerbilgieklemeıd.json')
    * request myBody
    * method post
    * status 200
