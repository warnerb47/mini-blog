package soapService.server;


import javax.xml.ws.Endpoint;

import soapService.dao.MongoConnection;
import soapService.service.UserService;

public class Server {
    public static void main(String[] args) {
        String url = "http://localhost:5000/";
        MongoConnection connection = new MongoConnection();
        Endpoint.publish(url, new UserService(connection.database));
        System.out.println(url+"wsdl?wsdl");

    }

}

