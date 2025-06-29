Feature:

  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') {"email": "sadikislar@itopiatech.com.tr","password": "Walkedu.25"}
    * def authToken =  'Bearer '+myToken.Token

  Scenario: ilgi alani ekleme
    * url baseURL
    * path '/instructor-interest'
    * header token = authToken
    * def myBody = read('classpath:data/interestId.json')
    * request myBody
    * method Post
    * status 200
    * def areaList = response.interestedAreas
    * def lastIndex = karate.sizeOf(areaList) - 1
    * assert areaList[lastIndex]._id == "66baf2c8dc2e132d28923eb7"