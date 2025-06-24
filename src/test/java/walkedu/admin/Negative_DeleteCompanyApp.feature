Feature: (Negative)Delete Company App - Admin

  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"walkeduroot@gmail.com","password":"Walkedu.25"}
    * def authToken =  'Bearer '+myToken.Token

  Scenario: Deleting non-existed company application
    * url baseURL
    * path '/admin/app-company/678a52d54b764796f383f427'
    * header token = authToken
    * method Delete
    * status 404
    * assert response.type == "NotFoundException"

  Scenario: Deleting company application unauthorized
    * url baseURL
    * path '/admin/app-company/678a52d54b764796f383f427'
    * method Delete
    * status 401
    * assert response.message == "Lütfen giriş yapınız."

  Scenario: Deleting company application with invalid ID
    * url baseURL
    * path '/admin/app-company/678a52d54b764796f383f42'
    * header token = authToken
    * method Delete
    * status 400
    * assert response.type == "BadRequestException"