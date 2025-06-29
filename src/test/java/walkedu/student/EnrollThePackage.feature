Feature: Enroll The Package-Student

  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"dilekkeserci@hotmail.com","password":"Walkedu.24"}
    * def authToken = 'Bearer ' + myToken.Token

  Scenario: Enroll the package
    * url baseURL
    * path '/enroll/672fb806f74cca7384f1b40e'
    * request
    """
    {
      "studentId": "685c3d3ddba4636ef456ffb4"
    }
    """
    * header token = authToken
    * method post
    * status 201