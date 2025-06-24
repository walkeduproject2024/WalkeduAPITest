Feature: Reject Personal App - Admin

  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"walkeduroot@gmail.com","password":"Walkedu.25"}
    * def authToken =  'Bearer '+myToken.Token

  Scenario: Rejecting personal apps
    * url baseURL
    * path '/admin/reject-personalapp/6789156f31f33222d1311fdd'
    * header token = authToken
    * def rejBody = read('classpath:data/rejectAppMsg.json')
    * request rejBody
    * method Patch
    * status 200
    * assert response.message == "Başvuru başarıyla reddedildi"