Feature: Get Urun Kategori

  Scenario: Get category id
    * def myToken = call read('classpath:caller/TokenCall.feature') { email: 'semaozdemiraslan@gmail.com', password: 'Walkedu.24' }
    * def authToken = 'Bearer ' + myToken.Token
    * url baseURL
    * header token = authToken
    * path '/list-product-category'
    * method get
    * status 201

    * def firstCategoryId = response.categories[0]._id
    * print 'First category ID:', firstCategoryId

    * def fourthCategoryName = response.categories[3].category
    * print 'Fourth category name:', fourthCategoryName

    * assert response.message == 'Category for products showed successfully.'