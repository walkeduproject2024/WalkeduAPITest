Feature: Profil Fotografının Guncellenebilirligi-Instructers
  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"sadikislar@itopiatech.com.tr","password":"Walkedu.25"}
    * def authToken =  'Bearer '+myToken.Token
  Scenario: Profil Fotografının Güncellenebilirliği
    * url baseURL
    * path /update-instructor-img
    def myBody =