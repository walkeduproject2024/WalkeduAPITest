Feature: (Negative)Create Supporter - Admin

  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"walkeduroot@gmail.com","password":"Walkedu.25"}
    * def authToken =  'Bearer '+myToken.Token

  Scenario: Unauthorized attempt for creating a supporter
    * url baseURL
    * path '/admin/createsupporter'
    * def myBody = read('classpath:data/newSupporter.json')
    * request myBody
    * method Post
    * status 401
    * assert response.message == "Lütfen giriş yapınız."


  Scenario: Creating supporter with existing e-mail
    * url baseURL
    * path '/admin/createsupporter'
    * header token = authToken
    * def myBody = read('classpath:data/newSupporter.json')
    * request myBody
    * method Post
    * status 401
    * assert response.message == "Email already in use."


  Scenario: Creating supporter with missing body
    * url baseURL
    * path '/admin/createsupporter'
    * header token = authToken
    * def myBody = read('classpath:data/newSupporter.json')
    * request myBody
    * method Post
    * status 400
    * assert response.type == "ValidationError"

  Scenario: Creating supporter with invalid e-mail format
    * url baseURL
    * path '/admin/createsupporter'
    * header token = authToken
    * def myBody = read('classpath:data/newSupporter.json')
    * request myBody
    * method Post
    * status 400
    * assert response.details == "User validation failed: email: Lütfen geçerli bir e-posta adresi girin"

