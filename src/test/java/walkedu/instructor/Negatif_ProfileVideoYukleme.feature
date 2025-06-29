Feature:
  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') {"email": "sadikislar@itopiatech.com.tr","password": "Walkedu.25"}
    * def authToken =  'Bearer '+myToken.Token
  Scenario:Video yükleme
    * url baseURL
    * path '/instructor-video'
    * header token = authToken
    And multipart field title = 'KarateTest'
    And multipart file replyVideo = { read: 'classpath:data/GidiyorumEcele.mp4', filename: 'GidiyorumEcele.mp4', contentType: 'video/mp4' }
    When method post
    Then status 400
    * match response.message.trim() == 'Video başarı ile yüklendi, Admin tarafından onaylandığı taktirde yayımlanacaktır.'