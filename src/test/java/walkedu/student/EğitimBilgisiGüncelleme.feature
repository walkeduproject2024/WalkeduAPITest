Feature: Eğitim Bilgisi Güncelleme-Student

  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"dilekkeserci@hotmail.com","password":"Walkedu.24"}
    * def authToken = 'Bearer ' + myToken.Token

  Scenario: Eğitim bilgisi güncelleme
    * url baseURL
    * path '/student/edu-profile/685c3d3ddba4636ef456ffb6'
    * request
    """
    {"schooleName": "Birinci İlkokul",
        "grade": "",
        "status": "",
        "_id": "685c3d3ddba4636ef456ffb6"
      }
    """
    * header token = authToken
    * method patch
    * status 200