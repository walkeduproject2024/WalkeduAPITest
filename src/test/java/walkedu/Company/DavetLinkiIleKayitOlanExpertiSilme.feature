Feature: DELETE Davet Linki ile Kayit Olan Expert'i Silme - Company

  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"okurmahir7@gmail.com","password":"Walkedu.24"}
    * def authToken =  'Bearer ' + myToken.Token

  Scenario: Oluşturulan expert kaydını sil
    * url baseURL
    * path '/sirket/expert/686a733b992249a0bf038ace'
    * header token = authToken
    * method DELETE
    * status 200

