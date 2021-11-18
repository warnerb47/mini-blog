import requests

url = 'http://localhost:3000/service/user'
headers = {'user-agent': 'my-app/0.0.1'}

def login(login, password):
    payload = {'login': login,'password': password}
    response = requests.post(url+"/login", json=payload)
    return response.json()['data']

def fetchUsers(token):
    response = requests.get(url, headers={'Authorization': 'Bearer '+token})
    return response.json()['data']

def postUser(token, login, password, name):
    payload = {'login': login,'password': password, 'name': name}
    response = requests.post(url, headers={'Authorization': 'Bearer '+token}, json=payload)
    return response.json()['data']

def patchUser(token, id, login, password, name):
    payload = {'login': login,'password': password, 'name': name}
    response = requests.patch(url+'/'+id, headers={'Authorization': 'Bearer '+token}, json=payload)
    return response.json()['data']

def deleteUser(token, id):
    response = requests.delete(url+'/'+id, headers={'Authorization': 'Bearer '+token})
    return response.json()['data']

#print(login('admin', 'admin'))
# token = login('admin', 'admin')
# print(fetchUsers(token))
# print(postUser(token, 'killer', 'killer', 'killer'))
# print(patchUser(token,'6187f9dceeab3688b5d586b5', 'killerUpdated', 'killerUpdated', 'killer'))
# print(deleteUser(token, '6187f9dceeab3688b5d586b5'))