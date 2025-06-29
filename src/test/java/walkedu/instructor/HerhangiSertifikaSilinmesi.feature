Feature: Sertifikanın Silinebilirliği-Instructors
  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"sadikislar@itopiatech.com.tr","password":"Walkedu.25"}
    * def authToken =  'Bearer '+myToken.Token
  Scenario: Sertifikanın Silinmesi
    * url baseURL
    * path '/instructor-delete-certificate/6860893f992249a0bf01a5b0'
    * header token = authToken
    * method delete
    * status 204

