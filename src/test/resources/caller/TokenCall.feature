Feature: Token
  Scenario: Token
    * url 'https://walkedu.juniussoft.com/walkedu/api'
    * path '/auth/login'
    * def myBody =
    """
    {
    "email": '#(email)',
    "password": '#(password)'

    }
    """
    * request myBody
    * method post
    * def Token = response.accessToken
    * print Token