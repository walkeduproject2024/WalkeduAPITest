Feature: urun silme

  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') { email: 'semaozdemiraslan@gmail.com', password: 'Walkedu.24' }
    * def authToken = 'Bearer ' + myToken.Token
    * url baseURL
    * header token = authToken

  Scenario: Son eklenen ürünü getir
    * url baseURL
    * path '/get-self-products'
    * header token = authToken
    * method Get
    * status 200
    * def sonUrun = response.products[0]._id
    * print 'Son ürün:', sonUrun


  Scenario: ürün silme
    * path '/delete-self-product/686c5f8c992249a0bf03dfff'
    When method delete
    Then status 200
    * assert response.message == 'Ürün silindi'

