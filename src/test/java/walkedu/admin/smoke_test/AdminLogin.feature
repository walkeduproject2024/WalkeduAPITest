Feature: Login as Admin - Admin

  Background:
    * url baseURL
    * def myToken = call read('classpath:caller/TokenCall.feature') {"email":"walkeduroot@gmail.com","password":"Walkedu.25"}
    * def authToken =  'Bearer '+myToken.Token


  Scenario: login as admin
    * url baseURL
    * path '/auth/login'
    * def adminLogin = read('classpath:data/adminLoginBody.json')
    * request adminLogin
    * method Post
    * status 200
    * assert response.userDetails.name == "Walkedu Admin"

  Scenario: Eğitmene Aylık Randevu Ödemesi Yapma
    * url baseURL
    * path 'homepage/experts'
    * header token = authToken
    * method Get
    * status 200
    * assert response.length > 0
    * def firstInstructor = response.instructors[0]
    * def instructorId = firstInstructor._id
    * print 'Kullanılacak Instructor ID:', instructorId

    * path 'admin/all-appointments'
    * header token = authToken
    * method Get
    * status 200
    * assert response.message == "Tüm randevular listelenmekte"
    * def firstAppointment = response.appointments[3]
    * def appointmentID = firstAppointment._id
    * print 'Kullanılacak Appointment ID:', appointmentId

    * path 'admin/pay-appointment-salary/' +instructorId
    * header token = authToken
    * def paymentPDF = read('classpath:data/testPaymentPDF.pdf')
    * multipart field paymentType = 'Appointment Payment'
    * multipart file pdf = {read: 'classpath:data/testPaymentPDF.pdf', filename: 'testPaymentPDF.pdf', contentType: 'application/pdf' }
    * multipart field description = 'Randevu Ödemesi test'
    * multipart field amount = '5500'
    * multipart field appointmentId = appointmentID
    * method Post
    * status 200
    * assert response.message == "Yapılan randevu ödeme detayları kaydedilmiştir."




