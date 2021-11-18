from service import *
from pages import *

url="http://localhost:5000/wsdl?wsdl"
#headers = {'content-type': 'application/soap+xml'}
headers = {'content-type': 'text/xml'}

# getUsers(url, headers)
#getUser(url, headers, "617b2bb4ebbd8e4965450a7c")
# deleteUser(url, headers, "617b2bb4ebbd8e4965450a7c")
# postUser(url, headers, "login", "name", "password")

customers = [
    {
        'login': 'warner',
        'password': 'warner',
        'name': 'warner'
    },
    {
        'login': 'admin',
        'password': 'admin',
        'name': 'admin'
    },
    {
        'login': 'lol',
        'password': 'lol',
        'name': 'lol'
    },
]
homePage()
listUsersPage(customers)
newUserPage()
deleteUserPage()