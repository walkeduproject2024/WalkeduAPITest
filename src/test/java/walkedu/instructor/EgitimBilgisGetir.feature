Feature: Get Instructors Edu Infos
  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"sadikislar@itopiatech.com.tr","password":"Walkedu.25"}
    * def authToken =  'Bearer '+myToken.Token
  Scenario: Get Instructors Edu Infos
    * url baseURL
    * path '/instructor-edu'
    * header token = authToken
    * method Get
    * status 200
