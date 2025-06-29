Feature: Eğitmenin Resminin Getirilebilirliği
  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"sadikislar@itopiatech.com.tr","password":"Walkedu.25"}
    * def authToken =  'Bearer '+myToken.Token
  Scenario: Resmin Getirilmesi-Instructors
    * url baseURL
    * path '/file/default-founder-6693a0a17380505922be42bc-1724940256139.jpg'
    * method Get
    * status 200
    * match response.url contains "https://walkedu-bucket.s3.us-east-1.amazonaws.com/img/default-founder"