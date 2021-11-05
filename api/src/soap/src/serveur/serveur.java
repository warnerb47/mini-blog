package serveur;

import javax.xml.ws.Endpoint;

import service.UserService;

public class serveur {

	public static void main(String[] args) {
		String url = "http://localhost:5000/";
		Endpoint.publish(url, new UserService());
		System.out.println(url+"wsdl?wsdl");

	}

}
