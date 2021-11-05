package service;

import java.util.ArrayList;
import java.util.List;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;

import domaine.User;

@WebService(name="UserService")
public class UserService{
	
	@WebMethod(operationName = "getUsers")
	public List<User> getUsers() {
		ArrayList<User> usersList = new ArrayList<User>();
		usersList.add(new User("user1", "user1", "user1", "1"));
		usersList.add(new User("user2", "user2", "user2", "2"));
		usersList.add(new User("user3", "user3", "user3", "3"));
		usersList.add(new User("user4", "user14", "user4", "4"));
		return usersList;
	}
	
	@WebMethod(operationName = "getUser")
	public User getUser(@WebParam(name="idUser") String idUser) {
		return new User();
	}
	
	@WebMethod(operationName = "postUser")
	public User postUser() {
		return new User();
	}
	
	@WebMethod(operationName = "updateUser")
	public User updateUser(@WebParam(name="payload")User payload, @WebParam(name="idUser")String idUser) {
		return new User();
	}
	
	@WebMethod(operationName = "deleteUser")
	public User deleteUser(@WebParam(name="idUser")String idUser) {
		return new User();
	}
	
	@WebMethod(operationName = "login")
	public String login(@WebParam(name="user")User user) {
		String logged = "logged";
		return logged;
	}
}
