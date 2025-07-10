Feature: E2E Company Test Flow - Login > Get Students > Deactivate Student

  Background:
    * url baseURL
    * def credentials = { email: 'okurmahir7@gmail.com', password: 'Walkedu.24' }

  Scenario: Kullanıcı giriş yapar, öğrenci listesini alır ve bir öğrenciyi pasif hale getirir

    # Login
    * path '/auth/login'
    * request credentials
    * method POST
    * status 200
    * def accessToken = response.accessToken
    * assert accessToken != null
    * def authToken = 'Bearer ' + accessToken

    # Get Students
    * path '/company-students'
    * params { page: 8, size: 10 }
    * header token = authToken
    * method GET
    * status 200
    * def responseJson = response
    * assert responseJson.totalCount == 11
    * assert responseJson.message == "Şirketteki aktif öğrenciler görüntülendi"

    # Deactivate Student (örnek öğrenci ID sabit girildi)
    * def studentId = '66f15588f28b544d6edf76cf'
    * path '/deactive-student', studentId
    * header Content-Type = 'application/json'
    * header token = authToken
    * request {}
    * method PATCH
    * status 200
    * def deactiveResponse = response
    * assert deactiveResponse.message == "Öğrenci Pasif Hale Getirilmiştir"
