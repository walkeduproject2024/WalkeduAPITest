Feature: Get All Applications - Admin

  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"walkeduroot@gmail.com","password":"Walkedu.25"}
    * def authToken =  'Bearer '+myToken.Token

    Scenario: Get all student applications
      * url baseURL
      * path '/admin/app-students'
      * params {page:1,size:10}
      * header token = authToken
      And method Get
      * status 200
      * assert response.message == "Tüm öğrenci başvuruları"