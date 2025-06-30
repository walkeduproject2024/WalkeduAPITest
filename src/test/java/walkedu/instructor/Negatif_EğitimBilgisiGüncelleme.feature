Feature: Eğitim Bilgisinin Güncellenebilirliği-Instructer
  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"sadikislar@itopiatech.com.tr","password":"Walkedu.25"}
    * def authToken =  'Bearer '+myToken.Token
  Scenario: Eğitim Bilgisinin Güncellenebilirliği
    * url baseURL
    * path '/instructor-edu/686096be992249a0bf01abe3'
    * header token = authToken
    * def myBody = read('classpath:data/eksikeğitimbilgisi.json')
    * request myBody
    * method patch
    * status 200
    * assert response[1].department == "Bilgisayar Mühendisliği"
