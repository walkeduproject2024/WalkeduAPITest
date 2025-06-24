Feature: Reject Personal App Negative Tests - Admin

  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"walkeduroot@gmail.com","password":"Walkedu.25"}
    * def authToken =  'Bearer '+myToken.Token

  Scenario: Rejecting personal apps that rejected before
    * url baseURL
    * path '/admin/reject-personalapp/67d290a21c28d5ce1c72754a'
    * header token = authToken
    * def rejBody = read('classpath:data/rejectAppMsg.json')
    * request rejBody
    * method Patch
    * status 400
    * assert response.message == "Başvuru daha önce sonuçlandırılmıştır."

  Scenario: Rejecting personal apps with an invalid ID
    * url baseURL
    * path '/admin/reject-personalapp/67d290a21c28d5ce1c72754b'
    * header token = authToken
    * def rejBody = read('classpath:data/rejectAppMsg.json')
    * request rejBody
    * method Patch
    * status 404
    * assert response.message == "Başvuru bulunamadı."

  Scenario: Rejecting personal apps without authorization
    * url baseURL
    * path '/admin/reject-personalapp/67d290a21c28d5ce1c72754a'
    * def rejBody = read('classpath:data/rejectAppMsg.json')
    * request rejBody
    * method Patch
    * status 401
    * assert response.message == "Lütfen giriş yapınız."