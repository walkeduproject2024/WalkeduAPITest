Feature: Get Urun Kategori

  Scenario: Get first category id
    * def myToken = call read('classpath:caller/TokenCall.feature') { email: 'semaozdemiraslan@gmail.com', password: 'Walkedu.24' }
    * def authToken = 'Bearer ' + myToken.Token
    * url baseURL
    * header token = authToken
    * path '/list-product-category'
    * method get
    * status 201
    * def firstCategoryId = response.categories[0]._id
    * karate.set('categoryId', firstCategoryId)
