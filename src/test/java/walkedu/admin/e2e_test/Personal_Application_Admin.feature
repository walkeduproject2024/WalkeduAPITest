Feature: Approving Personal Application E2E - Admin

  Background:
    * url baseURL
    * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"walkeduroot@gmail.com","password":"Walkedu.25"}
    * def authToken =  'Bearer '+myToken.Token

  Scenario: Create a personal application
    * url baseURL
    * path '/app-personal'
    * def personalCV = read('classpath:data/Admin_Personal_App_CV.pdf')
    * multipart field fullName = 'Tester Applicantx'
    * multipart field email = 'testerapp25@mail.com'
    * multipart field phone = '+905551234455'
    * multipart field dateOfBirth = '2000-01-01'
    * multipart field bachelor = 'Psikoloji'
    * multipart field branch = '677bedb158f2c77e5b49cd48'
    * multipart field expertise = 'Özel Eğitim'
    * multipart field master = 'Yok'
    * multipart field doctorate = 'Yok'
    * multipart field gender = 'Male'
    * multipart field maritalStatus = 'Single'
    * multipart field driverLicense = 'Available'
    * multipart field militaryStatus = 'Exempt'
    * multipart field nationality = 'Turkish'
    * multipart field country = 'Türkiye'
    * multipart field city = 'İstanbul'
    * multipart field district = 'Kadıköy'
    * multipart field neighborhood = 'Moda'
    * multipart field applicationPosition = 'Uzman Danışman'
    * multipart field experienceDuration = '5'
    * multipart field additionalNotes = 'Yok'
    * multipart file cvPath = {read: 'classpath:data/Admin_Personal_App_CV.pdf', filename: 'Admin_Personal_App_CV.pdf', contentType: 'application/pdf' }
    * multipart field acceptKVKK = 'true'
    * multipart field acceptAppointment = 'true'
    * method Post
    * status 201
    * assert response.message == "Kişisel başvurunuz başarıyla alındı."

  Scenario: Login as admin
    * url baseURL
    * path '/auth/login'
    * def adminLogin = read('classpath:data/adminLoginBody.json')
    * request adminLogin
    * method Post
    * status 200
    * assert response.userDetails.name == "Walkedu Admin"

  Scenario: Get all personal apps and approve last created app
    * url baseURL
    * path '/admin/apps-personal'
    * header token = authToken
    * method Get
    * status 200
    * assert response.message == "Başvurular başarıyla alındı"
    * def newCreatedPersonalApp = response.applications[0]
    * def applicationId = newCreatedPersonalApp._id
    * print 'Created Application ID:', applicationId

    * request applicationId
    * path '/admin/approve-personalapp/' +applicationId
    * header token = authToken
    * method Post
    * status 201
    * assert response.message == "Başvuru başarıyla onaylandı"

  Scenario: Confirming approved application
    * url baseURL
    * path '/admin/apps-approved'
    * header token = authToken
    * method Get
    * status 200
    * def approvedPersonalApp = response.applications[0]
    * def approvedId = approvedPersonalApp._id
    * print 'Approved Application ID:', approvedId
    * assert response.message == "Onaylanan başvurular başarıyla alındı"
    * assert response.applications[0]._id == approvedId

  Scenario: Confirming instructor
    * url baseURL
    * path '/admin/instructors-profiles'
    * header token = authToken
    * method Get
    * status 200
    * assert response.instructors[0].user.name == "Tester Applicantx"


