Feature:Tıbbi tanı rapor ekleme -Student

  Background:

    * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"dilekkeserci@hotmail.com","password":"Walkedu.24"}
    * def authToken = 'Bearer ' + myToken.Token
    * url baseURL
    * path '/student/medical-profile'
    * header token = authToken

    * request
"""
    {
      "_id": "685c3d3ddba4636ef456ffb4",
      "medicalHistory": [
        {
          "medicalDia": [
            {
              "_id": "66edde26f8a70f3b5b1faf53",
              "medicalDia": "Dikkat Eksikliği Hiperaktivite Bozukluğu (DEHB)",
              "createdAt": "2024-09-20T20:42:14.826Z",
              "updatedAt": "2024-09-20T20:42:14.826Z",
              "__v": 0
            }
          ],
          "reports": [
            {
              "path": "GoIT_QA_Agreement-685c3b72dba4636ef456ff80-1750875166388.pdf",
              "_id": "685c3d3ddba4636ef456ffb8"
            },
            {
              "path": "GoIT_QA_Agreement-685c3b72dba4636ef456ff80-1750929899493.pdf",
              "_id": "685d11ec992249a0bf0167ce"
            }
          ],
          "medicine": "Birinci Kullanılan ilaç adı",
          "_id": "685c3d3ddba4636ef456ffb7"
        }
      ]
    }
    """
* method put
* status 200