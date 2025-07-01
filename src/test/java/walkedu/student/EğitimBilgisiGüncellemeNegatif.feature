Feature: Tokensız eğitim bilgisi güncelleme - Negatif test

  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"dilekkeserci@hotmail.com","password":"Walkedu.24"}
    * def authToken =  'Bearer '+myToken.Token



  Scenario: Token olmadan eğitim bilgisi güncellenmeye çalışıldığında hata dönmeli
    * url baseURL
    * path '/student/edu-profile/685c3d3ddba4636ef456ffb6'
    * request
    """
    {
      "schooleName": "Mustafa İlkokulu",
      "grade": "8",
      "status": "",
      "_id": "685c3d3ddba4636ef456ffb6"
    }
    """
    * method patch
    * status 401
    * match response.message == "Lütfen giriş yapınız."
