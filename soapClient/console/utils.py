import xml.etree.ElementTree as ET


# GetUsers =  '''<?xml version=\'1.0\' encoding=\'UTF-8\'?>
#   <S:Envelope xmlns:S="http://schemas.xmlsoap.org/soap/envelope/">
#     <S:Body>
#         <ns2:getUsersResponse xmlns:ns2="http://service.soapService/">
#             <return>
#                 <login>admin</login>
#                 <name>admin</name>
#                 <password>admin</password>
#             </return>
#             <return>
#                 <login>warner</login>
#                 <name>warner</name>
#                 <password>warner</password>
#             </return>
#             <return>
#                 <login>login</login>
#                 <name>name</name>
#                 <password>password</password>
#             </return>
#         </ns2:getUsersResponse>
#     </S:Body>
#   </S:Envelope>'''

# GetUser = '''<?xml version=\'1.0\' encoding=\'UTF-8\'?>
# <S:Envelope xmlns:S="http://schemas.xmlsoap.org/soap/envelope/">
#     <S:Body>
#         <ns2:getUserResponse xmlns:ns2="http://service.soapService/">
#         <return>
#             <login>admin</login>
#             <name>admin</name>
#             <password>admin</password>
#         </return>
#         </ns2:getUserResponse>
#     </S:Body>
# </S:Envelope>

# '''



def extractData(xmlResponse, request='getUsers'):
    dom = ET.fromstring(xmlResponse)
    # define namespace mappings to use as shorthand below
    namespaces = {
        'S':'http://schemas.xmlsoap.org/soap/envelope/',
        'ns2':'http://service.soapService/'
    }
    customersElement = dom.findall(
        './S:Body'
        '/ns2:{request}Response'
        '/return'.format(request=request),
        namespaces
    )

    customers = []
    for customerElement in customersElement:
        customer = {
            'login': customerElement.find('login').text,
            'name': customerElement.find('name').text,
            'password': customerElement.find('password').text,
        }
        customers.append(customer)

    return customers

#print(extractData(GetUsers))
#print(extractData(GetUser, 'getUser'))