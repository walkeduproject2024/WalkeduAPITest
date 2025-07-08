Feature: Eğitim Bilgisi Güncelleme - Student

  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') { email: 'dilekkeserci@hotmail.com', password: 'Walkedu.24' }
    * def authToken = 'Bearer ' + myToken.Token

  Scenario: Eğitim bilgisi güncelleme
    * def requestBody = read('classpath:data/eduUpdateRequest.json')
    * url baseURL
    * path '/student/edu-profile/6861abfa992249a0bf01c654'
    * header token = authToken
    * request requestBody
    * method patch
    * status 200
    * print response
    * match response.eduInfo.schooles[1].schooleName == 'Atatürk Orta Okulu'
