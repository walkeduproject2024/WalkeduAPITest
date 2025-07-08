Feature: Yayımcı Yeni Ürün Oluşturma - POST (JSON + Multipart)

  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') { email: 'semaozdemiraslan@gmail.com', password: 'Walkedu.24' }
    * def authToken = 'Bearer ' + myToken.Token
    * url baseURL
    * path '/create-product'
    * header token = authToken

  Scenario: Kategori çek ve ürün oluştur (multipart/form-data)
    * def myImage = { read: 'classpath:data/bannerTest.png', filename: 'bannerTest.png', contentType: 'image/png' }
    And multipart field publishLabel = 'Yeni Sema Yayimcilik'
    And multipart field productName = 'intellij deneme12'
    And multipart field categories = '6761c1643723e9250860dfaa'
    * multipart file productImg = myImage
    And multipart field description = 'Eğitici, dikkat geliştirici set.'
    And multipart field stock = 100
    And multipart field price = '15.500,50'
    And multipart field discountRate = 0

    When method post
    Then status 201
    * assert response.message == 'Ürün oluşturuldu'
