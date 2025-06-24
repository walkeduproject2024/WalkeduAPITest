Feature:

  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') {"email": "sadikislar@itopiatech.com.tr","password": "Walkedu.25"}
    * def authToken =  'Bearer '+myToken.Token

  Scenario: ilgi alani ekleme
    * url baseURL
#    * params {page:1,size:10}
    * path '/instructor-interest'
    * header token = authToken
    * def myBody =
    """
    {
     "interestID" : "66baf2c8dc2e132d28923eb7"

}
    """

    * request myBody
    * method Post
    * status 200
#    * print response
    * def areaList = response.interestedAreas
    * def lastIndex = karate.sizeOf(areaList) - 1
    * assert areaList[lastIndex]._id == "66baf2c8dc2e132d28923eb7"