Feature: POST Davet Linki İle Expert olarak kaydolma - Company


  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"okurmahir7@gmail.com","password":"Walkedu.24"}
    * def authToken =  'Bearer '+myToken.Token

  Scenario: Create new supporter
    * url baseURL
    * path '/sirket/expert/f019fdb46a9cb851cb626d7e67bf22a3f0f0811ac85efaf07689b9e785940b41'
    * header token = authToken
    * def myBody = read('classpath:data/ExpertKayit.json')
    * request myBody
    * method POST
    * status 200
    * print 'aboutMe:', response.aboutMe
    * assert response.aboutMe == null