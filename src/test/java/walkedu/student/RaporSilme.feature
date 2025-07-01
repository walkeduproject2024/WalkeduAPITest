Feature: Rapor silme -student

  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"dilekkeserci@hotmail.com","password":"Walkedu.24"}
    * def authToken =  'Bearer '+myToken.Token

    Scenario: Rapor silme
      * url baseURL
      * path '/student/report/68640250992249a0bf02d5a5/'
      * header token = authToken
      * request
      """
      {
          "_id": "68640250992249a0bf02d5a5"
        }
        """
      * method delete
      * status 200
      * print response
