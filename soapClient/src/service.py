import requests

def getUsers(url, headers):
  body = """<?xml version="1.0" encoding="UTF-8"?>
            <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ser="http://service.soapService/">
              <soapenv:Header/>
              <soapenv:Body>
                  <ser:getUsers/>
              </soapenv:Body>
            </soapenv:Envelope>"""
  response = requests.post(url,data=body,headers=headers)
  print(response.content)


def getUser(url, headers, idUser):
  body = """<?xml version="1.0" encoding="UTF-8"?>
            <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ser="http://service.soapService/">
              <soapenv:Header/>
              <soapenv:Body>
                  <ser:getUser>
                    <!--Optional:-->
                    <idUser>{idUser}</idUser>
                  </ser:getUser>
              </soapenv:Body>
            </soapenv:Envelope>""".format(idUser=idUser)
  response = requests.post(url,data=body,headers=headers)
  print(response.content)


def deleteUser(url, headers, idUser):
  body = """<?xml version="1.0" encoding="UTF-8"?>
            <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ser="http://service.soapService/">
              <soapenv:Header/>
              <soapenv:Body>
                  <ser:deleteUser>
                    <!--Optional:-->
                    <idUser>{idUser}</idUser>
                  </ser:deleteUser>
              </soapenv:Body>
            </soapenv:Envelope>""".format(idUser=idUser)
  response = requests.post(url,data=body,headers=headers)
  print(response.content)


def postUser(url, headers, login, name, password):
  body = """<?xml version="1.0" encoding="UTF-8"?>
            <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ser="http://service.soapService/">
              <soapenv:Header/>
              <soapenv:Body>
                <ser:postUser>
                  <!--Optional:-->
                  <payload>
                      <!--Optional:-->
                      <login>{login}</login>
                      <!--Optional:-->
                      <name>{name}</name>
                      <!--Optional:-->
                      <password>{password}</password>
                      <!--Optional:-->
                      <_id>?</_id>
                  </payload>
                </ser:postUser>

              </soapenv:Body>
            </soapenv:Envelope>""".format(login=login, name=name, password=password)
  response = requests.post(url,data=body,headers=headers)
  print(response.content)
