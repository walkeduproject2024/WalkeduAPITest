Feature: Rapor silme -student

  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"dilekkeserci@hotmail.com","password":"Walkedu.24"}
    * def authToken =  'Bearer '+myToken.Token

    Scenario: Rapor silme
      * url baseURL
      * path '/student/report/685d11ec992249a0bf0167ce/'
      * header token = authToken
      * request
      """
      {
          "_id": "685d11ec992249a0bf0167ce"
        }
        """
      * method delete
      * status 200
      * print response
