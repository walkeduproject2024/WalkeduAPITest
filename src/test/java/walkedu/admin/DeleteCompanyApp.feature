Feature: Delete Company App - Admin

  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"walkeduroot@gmail.com","password":"Walkedu.25"}
    * def authToken =  'Bearer '+myToken.Token

  Scenario: Deleting company application
    * url baseURL
    * path '/admin/app-company/676ac46b17638a3121132bba'
    * header token = authToken
    * method Delete
    * status 204