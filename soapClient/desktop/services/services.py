import requests

url = 'http://localhost:3000/service/user'
headers = {'user-agent': 'my-app/0.0.1'}

def login(login, password):
    payload = {'login': login,'password': password}
    response = requests.post(url+"/login", json=payload)
    return response.json()['data']

def getUsers(token):
    response = requests.get(url, headers={'Authorization': 'Bearer '+token})
    return response.json()

def postUser(token, login, password, name):
    payload = {'login': login,'password': password, 'name': name}
    response = requests.post(url, headers={'Authorization': 'Bearer '+token}, json=payload)
    return response.json()

def updateUser(token, id, login, password, name):
    payload = {'login': login,'password': password, 'name': name}
    response = requests.patch(url+'/'+id, headers={'Authorization': 'Bearer '+token}, json=payload)
    return response.json()

def deleteUser(token, id):
    response = requests.delete(url+'/'+id, headers={'Authorization': 'Bearer '+token})
    return response.json()

#print(login('admin', 'admin'))
# token = login('admin', 'admin')
# print(getUsers(token))
# print(postUser(token, 'killer', 'killer', 'killer'))
# print(updateUser(token,'6187f9dceeab3688b5d586b5', 'killerUpdated', 'killerUpdated', 'killer'))
# print(deleteUser(token, '6187f9dceeab3688b5d586b5'))