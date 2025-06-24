Feature: Create Supporter - Admin

  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"walkeduroot@gmail.com","password":"Walkedu.25"}
    * def authToken =  'Bearer '+myToken.Token

  Scenario: Create new supporter
    * url baseURL
    * path '/admin/createsupporter'
    * header token = authToken
    * def myBody = read('classpath:data/newSupporter.json')
    * request myBody
    * method Post
    * status 201
    * assert response.message == "Destekçi profili başarı ile oluşturuldu"