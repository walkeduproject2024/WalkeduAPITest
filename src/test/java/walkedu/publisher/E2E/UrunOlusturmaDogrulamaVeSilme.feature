Feature: Publisher Product E2E Test Suite

  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') { email: 'semaozdemiraslan@gmail.com', password: 'Walkedu.24' }
    * def authToken = 'Bearer ' + myToken.Token


  Scenario: Create, Verify and Delete Product

    Given url baseURL
    And path 'create-product'
    * header token = authToken

  #  isim olusturma
    * def timestamp = new Date().getTime()
    * def productName = 'Test_Urunu_' + timestamp


#    * def myImage = { read: 'classpath:data/tennis.png', filename: 'tennis.png', contentType: 'image/png' }
    * def myImage = { read: 'classpath:data/bannerTest.png', filename: 'bannerTest.png', contentType: 'image/png' }
    * multipart field productName = productName
    * multipart field category = '6761c15b3723e9250860dfa8'
    * multipart field description = 'Test product description'
    * multipart field stock = 50
    * multipart field price = '15.500,50'
    * multipart field discountRate = 0
    * multipart field publishLabel = 'Yeni Sema Yayimcilik'
    * multipart file productImg = myImage

    When method post
    Then status 201
    * print 'Create edilen ürün:', response
    * def productId = response.product._id
    * print 'Product ID:', productId

  # 2. ürün kontrol
    Given url baseURL
    And path 'get-self-products'
    * header token = authToken
    And params { page: 1, size: 5 }

    When method get
    Then status 200
    * print 'son ürün:', response.products[0]
    * match response.products[0]._id == productId
    * match response.products[0].productName == productName

  # 3. Delete Product
    Given url baseURL
    And path 'delete-self-product/' + productId
    * header token = authToken

    When method delete
    Then status 200
    * match response.message contains 'silindi'
