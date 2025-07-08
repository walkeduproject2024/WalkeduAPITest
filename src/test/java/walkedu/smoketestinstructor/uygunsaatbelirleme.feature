Feature: Randevunun Uygun Saatinin Belirlenebilirliği-Instructer
  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"sadikislar@itopiatech.com.tr","password":"Walkedu.25"}
    * def authToken =  'Bearer '+myToken.Token
  Scenario: Uygun Randevu Saati Belirleme
    * url baseURL
    * path '/add-availability'
    * header token = authToken
    * def myBody = read('classpath:data/uygunsaat.json')
    * request myBody
    * method post
    * status 200
    * match response.message == "Belirlediğiniz tarihler randevu alımına açılmıştır"



