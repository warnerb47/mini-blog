
import requests

url = 'http://localhost:3000/service/user'
headers = {'user-agent': 'my-app/0.0.1'}

def login(login, password):
    payload = {'login': login,'password': password}
    response = requests.post(url+"/login", json=payload)
    return response.json()['data']

#print(login('admin', 'admin'))