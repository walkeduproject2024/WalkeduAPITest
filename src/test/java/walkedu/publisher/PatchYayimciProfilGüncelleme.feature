Feature: Yayımcı Profil Güncelleme - PATCH (logo + json)

  Background:
    * def myToken = call read('classpath:caller/TokenCall.feature') { "email": "semaozdemiraslan@gmail.com", "password": "Walkedu.24" }
    * def authToken = 'Bearer ' + myToken.Token
    * url baseURL
    * path '/update-publisher-profile'
    * header token = authToken

  Scenario: Yayımcı profilini logo + bilgilerle multipart olarak güncelle
    * def imageFile = { read: 'classpath:data/tennis.png', filename: 'tennis.png', contentType: 'image/png' }
    And multipart file logo = imageFile
    And multipart field country = 'Spain'
    And multipart field state = 'Cadiz'
    And multipart field district = 'Puerto Real'
    And multipart field address = 'Calle Union De Hermanos'
    And multipart field authorizeds[0][name] = 'Sema Aslan'
    And multipart field authorizeds[0][phoneNumber] = '+905551230404'
    And multipart field authorizeds[0][email] = 'tekrarsema@gmail.com'
    And multipart field authorizeds[0][duty] = 'QA Engineer'
    When method patch
    Then status 200

    * def profile = response.profile
    *  assert response.message == 'Profiliniz Güncellendi'
    * match response.profile.authorizeds[0].email == 'tekrarsema@gmail.com'
    * match profile.user.img contains 'tennis-'
    * match profile.country == 'Spain'
    * match profile.state == 'Cadiz'
    * match profile.district == 'Puerto Real'
    * match profile.address == 'Calle Union De Hermanos'
    * match profile.authorizeds[0].name == 'Sema Aslan'
    * match profile.authorizeds[0].email == 'tekrarsema@gmail.com'
    * match profile.authorizeds[0].duty == 'QA Engineer'
