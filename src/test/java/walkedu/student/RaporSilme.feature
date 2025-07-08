Feature: Rapor silme -student

  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"dilekkeserci@hotmail.com","password":"Walkedu.24"}
    * def authToken =  'Bearer '+myToken.Token

  Scenario: Silinmiş veya geçersiz rapor ID ile silme işlemi başarısız olmalı
    * url baseURL
    * def requestBody = read('classpath:data/InvalidDeleteReportRequest.json')
    * path '/student/report/68640250992249a0bf02d5a5/'
    * header token = authToken
    * method delete
    * status 404
    * match response.message == "Belirtilen rapor bulunamadı"