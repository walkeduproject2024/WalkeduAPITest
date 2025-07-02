Feature: Hakkında Bölümünün Güncellenmesi-Instructer
  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"sadikislar@itopiatech.com.tr","password":"Walkedu.25"}
    * def authToken =  'Bearer '+myToken.Token
  Scenario: Hakkında Bölümünün Güncellenmesi
    * url baseURL
    * path '/instructor-about-me'
    * header token = authToken
    * def myBody = read('classpath:data/hakkındaguncelleme.json')
    * request myBody
    * method patch
    * status 200
    * assert response.other.interestedAreas[0].interestedArea == "Okul Yaşındaki Çocukların Gelişimi"