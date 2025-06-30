Feature: urun silme

  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') { email: 'semaozdemiraslan@gmail.com', password: 'Walkedu.24' }
    * def authToken = 'Bearer ' + myToken.Token
    * url baseURL
    * header token = authToken

  Scenario: ürün silme

    * path '/delete-self-product/6861dc11992249a0bf01df3f'
    When method delete
    Then status 200
    * assert response.message == 'Ürün silindi'
