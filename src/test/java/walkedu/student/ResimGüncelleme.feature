Feature: Resim güncelleme -Student

  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"dilekkeserci@hotmail.com","password":"Walkedu.24"}
    * def authToken = 'Bearer ' + myToken.Token
    Scenario:
      * url baseURL
      * path '/student/update-student-img'
      * request
    """
    {
    "_id": "685c3b72dba4636ef456ff80",
    "img": "2-685c3b72dba4636ef456ff80-1750930057606.JPG",
    "name": "Ahmet Yurt"
    }
    """
      * method patch
  * status 200
  * print response
