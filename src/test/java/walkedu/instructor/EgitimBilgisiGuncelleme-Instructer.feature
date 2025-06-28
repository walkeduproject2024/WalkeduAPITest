Feature: Eğitim Bilgisinin Güncellenebilirliği-Instructer
  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"sadikislar@itopiatech.com.tr","password":"Walkedu.25"}
    * def authToken =  'Bearer '+myToken.Token
  Scenario: Eğitim Bilgisinin Güncellenebilirliği
    * url baseURL
    * path '/instructor-edu/6852f7c20dffbb5936106df6'
    * header token = authToken
    * def myBody = read('classpath:data/egitimbilgisi.json')
    * request myBody
    * method patch
    * status 200
    * assert response[1].department == "Bilgisayar Mühendisliği"
