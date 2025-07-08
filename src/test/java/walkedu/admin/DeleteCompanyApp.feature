Feature: Delete Company App - Admin

  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"walkeduroot@gmail.com","password":"Walkedu.25"}
    * def authToken =  'Bearer '+myToken.Token

  Scenario: Deleting company application
    * url baseURL
    * path '/admin/app-company/67697d7d840d5e79c451dfbe'
    * header token = authToken
    * method Delete
    * status 204
    * assert response == ''