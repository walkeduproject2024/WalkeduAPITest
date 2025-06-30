Feature: Get Publisher products

  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"semaozdemiraslan@gmail.com","password":"Walkedu.24"}
    * def authToken =  'Bearer '+myToken.Token

  Scenario: Get Publisher products
    * url baseURL
    * path '/get-self-products'
    * header token = authToken
    * params {page:1,size:10}
    * method Get
    * status 200
    * assert response.message == "Ürünler listeleniyor"