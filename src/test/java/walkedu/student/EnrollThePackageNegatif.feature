Scenario: Geçersiz öğrenci ID ile pakete kayıt başarısız olmalı
* url baseURL
* path '/enroll/672fb806f74cca7384f1b40e'
* request
"""
    {
      "studentId": "gecersiz-id-123"
    }
    """
* header token = authToken
* method post
* status 404
* print response
* match response.message contains 'not found'
