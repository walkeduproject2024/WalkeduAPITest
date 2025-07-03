Feature: Sertifikanın Eklenebilirliği-Instructers
  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"sadikislar@itopiatech.com.tr","password":"Walkedu.25"}
    * def authToken =  'Bearer '+myToken.Token
  Scenario: Sertifikanın Eklenmesi
    * url baseURL
    * path '/instructor-add-certificates'
    * header token = authToken
    * multipart field title = 'pdf'
    * multipart file pdf = { read: 'classpath:data/sertifika.pdf', filename: 'sertifika.pdf', contentType: 'sertifika/pdf'  }
    * method post
    * status 200
    * assert response.other.certificates[0].pdfPath == "sertifika-66f13587f28b544d6edf72d4-1751153999194.pdf"
