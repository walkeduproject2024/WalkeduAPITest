Feature: Öğrenci Profili Görüntüleme - Negatif Test

  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"dilekkeserci@hotmail.com","password":"Walkedu.24"}
    * def authToken =  'Bearer '+myToken.Token

  Scenario: Var olmayan ID ile öğrenci profili görüntüleme
    * url baseURL
    * header token = authToken
    * configure headers = { Accept: 'application/json' }
    * def expectedEmpty = read('classpath:data/ExpectedEmptyBody.json')
    * path '/student/profile/685c3d8bba4636ef456ffb88'
    * method get
    * print 'Status:', responseStatus
    * status 404
    * match response contains 'Cannot GET'
